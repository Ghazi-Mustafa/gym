//
//  LoginSocialDataSource.swift
//  gymx
//
//  Created by Mustafa Ghazi on 16/03/26.
//

import UIKit

protocol LoginSocialDataSource {
    func loginWithGoogle(with viewController : UIViewController)async throws -> LoginResponseModel
}
