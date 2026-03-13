//
//  LoginRequestBody.swift
//  gymx
//
//  Created by Mustafa Ghazi on 11/03/26.
//

struct LoginRequestBody {
    let email : String
    let password : String
    
    init(entity : UserParams){
        self.email = entity.email
        self.password = entity.password
    }

}
