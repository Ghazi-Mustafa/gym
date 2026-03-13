//
//  LoginErrors.swift
//  gymx
//
//  Created by Mustafa Ghazi on 11/03/26.
//

import Foundation

enum LoginError : LocalizedError {
    case email(String)
    case password(String)
    case server(String)
    
    var errorDescription: String? {
        switch self {
        case .email(let message):
            return message
        case .password(let message):
            return message
        case .server(let error):
            return error
        }
    }
}
