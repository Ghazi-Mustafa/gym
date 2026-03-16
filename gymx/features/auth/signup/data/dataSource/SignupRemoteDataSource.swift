//
//  SignupRemoteDataSource.swift
//  gymx
//
//  Created by Mustafa Ghazi on 15/03/26.
//

protocol SignupRemoteDataSource {
    
    func signupWithEmail(with params:SignupRequestBody) async throws -> SignupResponseDto
}
