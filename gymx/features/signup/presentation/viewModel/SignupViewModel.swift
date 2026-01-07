//
//  SignupViewModel.swift
//  gymx
//
//  Created by Mustafa Ghazi on 24/11/25.
//


import Combine


class SignupViewModel : ObservableObject {
    
    
    @Published var firstNameTxtField : String = ""
    @Published var passwordTxtField : String = ""
    @Published var lastNameTxtField : String = ""
    @Published var emailTxtField : String = ""
    @Published var isChecked = false
}
