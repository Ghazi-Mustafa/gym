//
//  LoginRemoteDataSourceImpl.swift
//  gymx
//
//  Created by Mustafa Ghazi on 12/03/26.
//
import FirebaseAuth
import GoogleSignIn
import UIKit

class LoginRemoteDataSourceImpl : LoginRemoteDataSource {

    func loginUserEmailPassword(params: LoginRequestBody) async throws -> LoginResponseModel {
        print(params.email,params.password)
        do{
            let result = try await Auth.auth().signIn(withEmail: params.email, password: params.password)
            let user = result.user
            return LoginResponseModel(id: user.uid, email: user.email)
        }catch {
            throw  LoginError.server(HandleFireBaseErrors.map(error))
            
        }
    }
    
    
}
