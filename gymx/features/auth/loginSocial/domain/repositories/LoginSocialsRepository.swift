//
//  LoginSocialsRepository.swift
//  gymx
//
//  Created by Mustafa Ghazi on 16/03/26.
//

import UIKit

protocol LoginSocialsRepository {
    func loginWithGoogle(with viewController : UIViewController)async throws -> UserLoginResponse
}
