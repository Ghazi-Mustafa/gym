//
//  LoginViewModel.swift
//  gymx
//
//  Created by Mustafa Ghazi on 10/03/26.
//

import SwiftUI
import Combine

final class LoginViewModel : ObservableObject{
    @Published var state : ViewState<UserLoginResponse> = .idle
    @Published var email : String = ""
    @Published var password : String = ""
    private var loginWithEmailPasswordUseCase : LoginWithEmailPasswordUseCase
    private var loginTask: Task<Void, Never>?


 
    
    var isButtonDisabled : Bool{
        email.isEmpty || password.isEmpty 
    }
    
    init(loginWithEmailPasswordUseCase: LoginWithEmailPasswordUseCase) {
        self.loginWithEmailPasswordUseCase = loginWithEmailPasswordUseCase
    }
    
    
    
    func loginWithEmailAndPassword(){
        loginTask?.cancel()
        
        if let emailError = Validations.validateEmail(email){
            state = .failure(LoginError.email(emailError))
            return
        }
        if let passwordError = Validations.validatePassword(password){
            state = .failure(LoginError.password(passwordError))
            return
        }
        
        state = .loading
        let param = UserParams(email: email, password: password)
        loginTask = Task{
            do{
                let result = try await loginWithEmailPasswordUseCase(with: param)
                state = .success(result)
            }
            catch{
                if !Task.isCancelled{
                    state = .failure(error)
                }
            }
        }
    }
    
    
}
