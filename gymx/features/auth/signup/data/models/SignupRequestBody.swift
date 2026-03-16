//
//  SignupRequestBody.swift
//  gymx
//
//  Created by Mustafa Ghazi on 15/03/26.
//

struct SignupRequestBody : Codable{
    let email : String
    let password : String
    init(from entity: SignupUserEntity)  {
        self.email = entity.email
        self.password = entity.password
    }
}
