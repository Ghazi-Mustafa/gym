//
//  SignupRepo.swift
//  gymx
//
//  Created by Mustafa Ghazi on 24/11/25.
//

import Foundation

protocol SignupRepo {
    
    func signupWithEmail(request : SignupRequest) async -> Result<Void,Error>
    func signupWithGoogle() async -> Result<Void,Error>
    func signupWithApple() async -> Result<Void,Error>
}
