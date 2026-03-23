//
//  UserModel.swift
//  gymx
//
//  Created by Mustafa Ghazi on 20/03/26.
//

import Foundation

struct UserModel : Codable,Identifiable{
    var id:String
    var firstname : String?
    var lastname : String?
    var email : String?
    var gender : String?
    var dataBirth : Date?
    var weight : Double?
    var height : Double?
}
