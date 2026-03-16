//
//  SignupViewModel.swift
//  gymx
//
//  Created by Mustafa Ghazi on 24/11/25.
//


import Combine
import SwiftUI
import FirebaseAuth


class SignupViewModel : ObservableObject {
    
    
    @Published var firstNameTxtField : String = ""
    @Published var passwordTxtField : String = ""
    @Published var lastNameTxtField : String = ""
    @Published var emailTxtField : String = ""
    @Published var isChecked = false
    @Published var state = ViewState<SignupUserResponseEntity>.idle
    private  let signupWithEmailUseCase : SignupWithEmailUseCase
    var emailHasError : Bool {
        if case .failure(let error) = state, let signupError = error as? SignpErrors,case .email = signupError  {
            return true
        }
        return false
    }
    var firstnameHasError : Bool {
        if case .failure(let error) = state, let signupError = error as? SignpErrors,case .firstname = signupError  {
            return true
        }
        return false
    }
    var passHasError : Bool {
        if case .failure(let error) = state, let signupError = error as? SignpErrors,case .password = signupError  {
            return true
        }
        return false
    }
    var lastnameHasError : Bool {
        if case .failure(let error) = state, let signupError = error as? SignpErrors,case .lastname = signupError  {
            return true
        }
        return false
    }
    
    init(signupWithEmailUseCase : SignupWithEmailUseCase){
        self.signupWithEmailUseCase = signupWithEmailUseCase
    }
    
    func signupWithEmail(){
        if isFormValidate(){
            state = .loading
            let params = SignupUserEntity(email: emailTxtField, password: passwordTxtField, firstname: firstNameTxtField, lastname: lastNameTxtField)
            Task{
                do{
                  let result =   try await signupWithEmailUseCase(with: params)
                    state = .success(result)
                }catch{
                    state = .failure(SignpErrors.server(error.localizedDescription))
                }
            }
        }
    }
    
    func isFormValidate()-> Bool{
        var errorMsg : String = ""
        if firstNameTxtField.isEmpty {
            errorMsg = L10n.Validation.firstNameRequired
            state = .failure(SignpErrors.firstname(errorMsg))
            return false
        }
        if lastNameTxtField.isEmpty {
            errorMsg = L10n.Validation.lastNameRequired
            state = .failure(SignpErrors.lastname(errorMsg))
            return false
        }
        if emailTxtField.isEmpty {
            errorMsg = L10n.Validation.emailRequired
            state = .failure(SignpErrors.email(errorMsg))
            return false
        }
        if let emailInvalid = Validations.validateEmail(emailTxtField){
            state = .failure(SignpErrors.email(emailInvalid))
            return false
        }
        if passwordTxtField.isEmpty {
            errorMsg = L10n.Validation.passwordRequired
            state = .failure(SignpErrors.password(errorMsg))
            return false
        }
        if let passwordInvalid = Validations.validatePassword(passwordTxtField){
            state = .failure(SignpErrors.password(passwordInvalid))
            return false
        }
        return true
    }
    
}
