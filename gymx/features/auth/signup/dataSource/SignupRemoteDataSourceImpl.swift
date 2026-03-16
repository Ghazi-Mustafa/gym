//
//  SignupRemoteDataSourceImpl.swift
//  gymx
//
//  Created by Mustafa Ghazi on 15/03/26.
//
import FirebaseAuth
class SignupRemoteDataSourceImpl : SignupRemoteDataSource{
    
    func signupWithEmail(with params: SignupRequestBody) async throws -> SignupResponseDto {
        do{
            let result =  try await Auth.auth().createUser(withEmail: params.email, password: params.password)
            let user = result.user
            return .init(id: user.uid, email: user.email)
        }catch{
            throw SignpErrors.server(HandleFireBaseErrors.map(error))
        }
    }
    
    
}
