//
//  LoginRemoteDataSource.swift
//  gymx
//
//  Created by Mustafa Ghazi on 11/03/26.
//

import UIKit

protocol LoginRemoteDataSource {
    func loginUserEmailPassword(params:LoginRequestBody) async throws -> LoginResponseModel
    func loginWithGoogle(with viewController : UIViewController)async throws -> LoginResponseModel
}
