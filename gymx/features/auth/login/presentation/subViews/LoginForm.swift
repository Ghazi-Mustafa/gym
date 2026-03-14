//
//  LoginForm.swift
//  gymx
//
//  Created by Mustafa Ghazi on 05/03/26.
//

import SwiftUI

struct LoginForm: View {

    @ObservedObject var vm : LoginViewModel
    var body: some View {
        VStack(spacing: 15){
            IconTextField(placeHolder: L10n.Auth.email.localized, text: $vm.email, leadingIcon: "envelope")
            PasswordTextField(password: $vm.password, placeholder: L10n.Auth.password.localized)
            if case .failure(let error) = vm.state {
                Text(error.localizedDescription.localized)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .foregroundColor(.red)
                    
                    
            }
        }
    }
}

//#Preview {
//    LoginForm(vm: .)
//}
