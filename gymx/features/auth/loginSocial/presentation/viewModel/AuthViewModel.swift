//
//  AuthViewModel.swift
//  gymx
//
//  Created by Mustafa Ghazi on 16/03/26.
//

import Combine
import UIKit

class AuthViewModel : ObservableObject{
    private let loginWithGoogleUseCase: LoginWithGoogleUseCase
    private var loginTask: Task<Void, Never>?
    private var isLoggingInWithGoogle : Bool = false
    private var state : ViewState<UserLoginResponse> = .idle
    
    init(loginWithGoogleUseCase: LoginWithGoogleUseCase) {
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
    
}
