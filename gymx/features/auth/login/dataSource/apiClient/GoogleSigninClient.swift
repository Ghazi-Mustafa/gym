//
//  GoogleSigninClient.swift
//  gymx
//
//  Created by Mustafa Ghazi on 12/03/26.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class GoogleSigninClient {
    
    
    func getGoogleCredential(from viewController: UIViewController) async throws -> AuthCredential{
        try await withCheckedThrowingContinuation { continuation in
            GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { result, error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }
                guard let user = result?.user,let idToken = user.idToken?.tokenString else {
                    continuation.resume(throwing: LoginError.server(L10n.Validation.noGoogleToken))
                    return
                }
                
                let credential = GoogleAuthProvider.credential(
                    withIDToken: idToken,
                    accessToken: user.accessToken.tokenString)
                continuation.resume(returning: credential)
            }
        }
    }
}
