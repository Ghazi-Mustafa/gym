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
    
    let googleClient : GoogleSigninClient
    init(googleClient: GoogleSigninClient) {
        self.googleClient = googleClient
    }
    
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
    
    func loginWithGoogle(with viewController: UIViewController) async throws -> LoginResponseModel {
        do {
            let credential = try await googleClient.getGoogleCredential(from: viewController)
            let result = try await Auth.auth().signIn(with: credential)
            let user = result.user
            return LoginResponseModel(id: user.uid, email: user.email)
        }catch let error as NSError{
            if error.domain == "FIRAuthErrorDomain" {
                throw LoginError.server(HandleFireBaseErrors.map(error))
            } else {
                throw LoginError.server(error.localizedDescription)
            }
        }
    }
    
}
