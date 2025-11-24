//
//  SignupViewModel.swift
//  gymx
//
//  Created by Mustafa Ghazi on 24/11/25.
//


import Combine


class SignupViewModel : ObservableObject {
    
    
    @Published var firstName : String = ""
    @Published var password : String = ""
    @Published var lastName : String = ""
    @Published var email : String = ""
    @Published var isChecked = false
}
