//
//  SignupWithEmailUseCase.swift
//  gymx
//
//  Created by Mustafa Ghazi on 15/03/26.
//


final class SignupWithEmailUseCase {
    private let repo: SignupRepo
    init(repository: SignupRepo) {
        self.repo = repository
    }
    
    func callAsFunction(with params : SignupUserEntity) async throws -> SignupUserResponseEntity{
        return try await repo.signupWithEmail(with: params)
    }
}
