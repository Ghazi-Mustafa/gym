//
//  SignupView.swift
//  gymx
//
//  Created by Mustafa Ghazi on 05/11/25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var vm : LoginViewModel
    init() {
        _vm = StateObject(wrappedValue: DIContainer.shared.resolve(LoginViewModel.self))
    }
    var body: some View {
        VStack(spacing: 15){
            TitleSection(title: L10n.Auth.heyThere.localized, descreption: L10n.Auth.welcomeBack.localized)
                .padding(.bottom,25)
            LoginForm(vm: vm)
            Spacer()
            AppCustomButton(
                title: L10n.Auth.login.localized,
                isDisabled: vm.isButtonDisabled,
                isLoading: vm.state.isLoading) {
                    vm.loginWithEmailAndPassword()
                }
            CustomDivider()
            AuthOptions {
                vm.loginWithGoogle()
            }
            DontHaveAccountRow()
        }
        .padding(.top,20)
        .padding(.horizontal,25)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .interactiveDismissDisabled()
    }
}

#Preview {
    LoginView()
}
