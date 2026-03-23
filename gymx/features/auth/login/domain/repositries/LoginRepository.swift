//
//  LoginRepo.swift
//  gymx
//
//  Created by Mustafa Ghazi on 10/03/26.
//

import UIKit

protocol LoginRepository {
    func loginUserEmailPassword(with userParams:UserParams)async throws -> UserLoginResponse
}
