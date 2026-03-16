//
//  SignpErrors.swift
//  gymx
//
//  Created by Mustafa Ghazi on 15/03/26.
//

import Foundation

enum SignpErrors : LocalizedError{
    case firstname(String)
    case lastname(String)
    case email(String)
    case password(String)
    case server(String)
    
    var errorDescription: String? {
        switch self {
        case .firstname(let msg):
            return msg
        case .lastname(let msg):
            return msg
        case .email(let msg):
            return msg
        case .password(let msg):
            return msg
        case .server(let msg):
            return msg
        }
    }
}
