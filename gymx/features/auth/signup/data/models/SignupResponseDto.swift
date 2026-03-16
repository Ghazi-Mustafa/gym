//
//  SignupResponseDto.swift
//  gymx
//
//  Created by Mustafa Ghazi on 15/03/26.
//

struct SignupResponseDto : Codable{
    var id : String
    var email : String?
    func toEntity() -> SignupUserResponseEntity {
        SignupUserResponseEntity(id: id, email: email)
    }
}
