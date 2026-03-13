//
//  Validations.swift
//  gymx
//
//  Created by Mustafa Ghazi on 10/03/26.
//

import Foundation

class Validations {
    static func validateEmail(_ email: String) -> String? {
        if email.isEmpty { return L10n.Validation.emailRequired }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if !emailPred.evaluate(with: email){
            return L10n.Validation.emailInvalid
        }
        return nil
    }
    
    static func validatePassword(_ password: String) -> String? {
        if password.isEmpty {
            return L10n.Validation.passwordRequired
        }
        if password.count < 8 {
            return L10n.Validation.passwordLengthError
        }
        if password.range(of:"[A-Z]",options: .regularExpression) == nil{
            return L10n.Validation.passwordUppercaseError
        }
        if password.range(of:"[a-z]",options: .regularExpression) == nil{
            return L10n.Validation.passwordLowercaseError
        }
        if password.range(of: "[0-9]", options: .regularExpression) == nil {
            return L10n.Validation.passwordNumberError
        }
        
        // New: check for special character
        if password.range(of: "[!@#$%^&*(),.?\":{}|<>]", options: .regularExpression) == nil {
            return L10n.Validation.passwordSpecialCharError
        }
        return nil
    }
    
}
