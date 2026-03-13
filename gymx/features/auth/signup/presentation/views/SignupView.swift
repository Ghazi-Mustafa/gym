//
//  SignupView.swift
//  gymx
//
//  Created by Mustafa Ghazi on 05/11/25.
//

import SwiftUI

struct SignupView: View {
    @StateObject var viewModel = SignupViewModel()
    
    var body: some View {
        GeometryReader{ geo in
            ScrollView {
                VStack(spacing: 15){
                    TitleSection(title: L10n.Auth.heyThere.localized, descreption: L10n.Auth.createAccount.localized)
                        .padding(.bottom,25)
                    
                    SignupForm(vm: viewModel)
                    
                    CheckBoxRow(isChecked: $viewModel.isChecked)
                        .padding(.leading,5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    AppCustomButton(title: L10n.Auth.register.localized, isDisabled: false,isLoading: false) {
                    }
                    
                    CustomDivider()
                    
                    AuthOptions {
                        
                    }
                    
                    AlreadyHaveAccountRow()
                        .padding(.vertical)
                }
                .ignoresSafeArea(.all, edges: .top)
                .padding(.top,20)
                .padding(.horizontal,25)
                .frame(minHeight: geo.size.height)
                
            }
            .onTapGesture {
                hideKeyboard()
            }
            .scrollDismissesKeyboard(.interactively)
        }
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    SignupView()
}
