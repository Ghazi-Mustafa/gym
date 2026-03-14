//
//  LoginResponseModel.swift
//  gymx
//
//  Created by Mustafa Ghazi on 11/03/26.
//

struct LoginResponseModel : Codable {
    let id : String?
    let email : String?
    
    func toEntity() -> UserLoginResponse{
        UserLoginResponse(id: id,email: email)
    }
}
