//
//  loginUseCase.swift
//  gymx
//
//  Created by Mustafa Ghazi on 10/03/26.
//

class LoginWithEmailPasswordUseCase {
    var repository: LoginRepository
    init(repository: LoginRepository) {
        self.repository = repository
    }
    func callAsFunction(with userParams: UserParams)async throws -> UserLoginResponse{
        try await repository.loginUserEmailPassword(with: userParams)
    }
}
