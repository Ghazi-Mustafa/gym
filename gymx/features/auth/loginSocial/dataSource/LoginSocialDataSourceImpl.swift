//
//  LoginSocialDataSourceImpl.swift
//  gymx
//
//  Created by Mustafa Ghazi on 16/03/26.
//

import UIKit
import FirebaseAuth

class LoginSocialDataSourceImpl : LoginSocialDataSource {
    let googleClient : GoogleSigninClient
    init(googleClient: GoogleSigninClient) {
        self.googleClient = googleClient
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
