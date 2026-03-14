//
//  SignupForm.swift
//  gymx
//
//  Created by Mustafa Ghazi on 24/11/25.
//

import SwiftUI

struct SignupForm: View {
    @ObservedObject var  vm : SignupViewModel
    var body: some View {
        VStack(spacing: 15){
            IconTextField(placeHolder: L10n.Auth.firstName.localized, text: $vm.firstNameTxtField, leadingIcon: "person")
            IconTextField(placeHolder: L10n.Auth.lastName.localized, text: $vm.lastNameTxtField, leadingIcon: "person")
            IconTextField(placeHolder:L10n.Auth.email.localized, text: $vm.emailTxtField, leadingIcon: "envelope")
            PasswordTextField(password: $vm.passwordTxtField, placeholder: L10n.Auth.password.localized)
            
        }
        .scrollDisabled(true)
        .scrollContentBackground(.hidden)

    }
}

