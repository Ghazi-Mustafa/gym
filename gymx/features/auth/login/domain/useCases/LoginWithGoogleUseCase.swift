//
//  LoginWithGoogleUseCase.swift
//  gymx
//
//  Created by Mustafa Ghazi on 12/03/26.
//

import UIKit

class LoginWithGoogleUseCase {
    private var repository: LoginRepository
    
    init(repository: LoginRepository) {
        self.repository = repository
    }
    
    func callAsFunction(with viewController: UIViewController) async throws -> UserLoginResponse{
        try await repository.loginWithGoogle(with: viewController)
    }
}
