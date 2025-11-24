//
//  PasswordTextField.swift
//  gymx
//
//  Created by Mustafa Ghazi on 24/11/25.
//

import SwiftUI

struct PasswordTextField: View {
    
    @Binding var password: String
    @State private var isSecure: Bool = true
    var placeholder: String = "Password"
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "lock")
                .foregroundStyle(Color(hex: "7B6F72"))
            
            ZStack(alignment: .leading){
                if password.isEmpty{
                    Text(placeholder)
                        .foregroundColor(Color(hex: "ADA4A5"))
                    
                }
                if isSecure {
                    SecureField("", text: $password)
                }else{
                    TextField("", text: $password)
                }
            }
            

            
            Image(systemName: isSecure ? "eye.slash" : "eye")
                .foregroundStyle(Color(hex: "7B6F72"))
                .onTapGesture {
                    isSecure.toggle()
                }
            
        }
        .padding()
        .listRowInsets(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
        .listRowSeparator(.hidden)
        .background(Color(hex: "F7F8F8"))
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}


