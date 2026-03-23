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

            IconTextField(placeHolder: L10n.Auth.firstName.localized, text: $vm.firstNameTxtField, leadingIcon: "person",hasError:vm.firstnameHasError )
            IconTextField(placeHolder: L10n.Auth.lastName.localized, text: $vm.lastNameTxtField, leadingIcon: "person",hasError: vm.lastnameHasError)
            IconTextField(
                placeHolder:L10n.Auth.email.localized,
                text: $vm.emailTxtField,
                leadingIcon: "envelope",
                hasError: vm.emailHasError,
                contentType: .emailAddress
            )
            PasswordTextField(
                password: $vm.passwordTxtField,
                placeholder: L10n.Auth.password.localized)
            if case .failure(let error) = vm.state {
                Text(error.localizedDescription.localized)
                    .font(.caption)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundStyle(.red)
            }
            
        }
        .scrollDisabled(true)
        .scrollContentBackground(.hidden)
        
    }
}

