//
//  HandleFireBaseErrors.swift
//  gymx
//
//  Created by Mustafa Ghazi on 12/03/26.
//

import Foundation
import FirebaseAuth


struct HandleFireBaseErrors {
    static func map(_ error : Error) -> String {
        guard let nsError = error as NSError?,
                let code = AuthErrorCode(rawValue: nsError.code) else {
            return L10n.Validation.defultError
        }
        
        switch code {
        case .invalidEmail,.invalidCredential:
            print(code,error)
            return L10n.Validation.emailInvalid
        case .userNotFound:
            print(code,error)
            return L10n.Validation.userNotFound
        case .userDisabled:
            print(code,error)
            return L10n.Validation.userDisabled
        case .wrongPassword:
            print(code,error)
            return L10n.Validation.worongEmailOrPassword
        default:
            print(code,error)
            return L10n.Validation.defultError
        }
    }
}
