//
//  LoginSocialRepositoryImpl.swift
//  gymx
//
//  Created by Mustafa Ghazi on 16/03/26.
//

import UIKit

class LoginSocialRepositoryImpl : LoginSocialsRepository {
    
    private let loginSocialDataSource: LoginSocialDataSource
    
    
    init(loginSocialDataSource: LoginSocialDataSource) {
        self.loginSocialDataSource = loginSocialDataSource
    }
    func loginWithGoogle(with viewController: UIViewController) async throws -> UserLoginResponse {
        let result = try await loginSocialDataSource.loginWithGoogle(with: viewController)
        return result.toEntity()
    }
}
