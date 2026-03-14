//
//  loginRepositriesimplementation.swift
//  gymx
//
//  Created by Mustafa Ghazi on 11/03/26.
//

import UIKit

class LoginRepositryImplementation : LoginRepository{
    
    let remoteDataSource : LoginRemoteDataSource
    init(remoteDataSource : LoginRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func loginUserEmailPassword(with userParams: UserParams) async throws -> UserLoginResponse {
        let request = LoginRequestBody(entity: userParams)
        let result = try await  remoteDataSource.loginUserEmailPassword(params: request)
        return result.toEntity()
    }
    
    func loginWithGoogle(with viewController: UIViewController) async throws -> UserLoginResponse {
        let result = try await remoteDataSource.loginWithGoogle(with: viewController)
        return result.toEntity()
    }
    
}
