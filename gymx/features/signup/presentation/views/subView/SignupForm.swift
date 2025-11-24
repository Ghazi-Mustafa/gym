//
//  SignupForm.swift
//  gymx
//
//  Created by Mustafa Ghazi on 24/11/25.
//

import SwiftUI

struct SignupForm: View {
    @Binding var firstName : String
    @Binding var lastName : String
    @Binding var email : String
    @Binding var password : String
    var body: some View {
        VStack(spacing: 15){
            IconTextField(placeHolder: "First Name", text: $firstName, leadingIcon: "person")
            IconTextField(placeHolder: "Last Name", text: $lastName, leadingIcon: "person")
            IconTextField(placeHolder:"Email", text: $email, leadingIcon: "envelope")
            PasswordTextField(password: $password, placeholder: "Password")
            
        }
        .scrollDisabled(true)
        .scrollContentBackground(.hidden)

    }
}

