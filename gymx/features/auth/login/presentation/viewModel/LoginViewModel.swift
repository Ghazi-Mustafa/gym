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
    private var loginWithGoogleUseCase : LoginWithGoogleUseCase
    private var loginTask: Task<Void, Never>?
    private var isLoggingInWithGoogle : Bool = false
 
    
    var isButtonDisabled : Bool{
        email.isEmpty || password.isEmpty 
    }
    
    init(loginWithEmailPasswordUseCase: LoginWithEmailPasswordUseCase,loginWithGoogleUseCase: LoginWithGoogleUseCase) {
        self.loginWithEmailPasswordUseCase = loginWithEmailPasswordUseCase
        self.loginWithGoogleUseCase = loginWithGoogleUseCase
    }
    
    func loginWithGoogle()  {
        loginTask?.cancel()
        guard !isLoggingInWithGoogle else {return}
        isLoggingInWithGoogle = true
       
        guard let rootVC = UIApplication.shared.getRootViewController() else {
            state = .failure(LoginError.server("No root view controller available"))
            return
        }
        state = .loading
       loginTask =  Task{
            do{
                let result = try await loginWithGoogleUseCase(with:rootVC )
                state = .success(result)
            
            }catch {
                if !Task.isCancelled{
                    state = .failure(error)
                }
            }
           defer {isLoggingInWithGoogle = false}
           loginTask = nil
        }

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
