//
//  SignupRepoImpl.swift
//  gymx
//
//  Created by Mustafa Ghazi on 15/03/26.
//

class SignupRepoImpl : SignupRepo {
    
    let remoteDataSource : SignupRemoteDataSource
    init(remoteDataSource: SignupRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    func signupWithEmail(with params : SignupUserEntity) async throws -> SignupUserResponseEntity {
        let result = try await remoteDataSource.signupWithEmail(with: SignupRequestBody(from: params))
        return result.toEntity()
        
    }
    
    func signupWithGoogle() async -> Result<Void, any Error> {
        .failure((any Error).self as! Error)
    }
    
    func signupWithApple() async -> Result<Void, any Error> {
        .failure((any Error).self as! Error)
    }
    
    
}
