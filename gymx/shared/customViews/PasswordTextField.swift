//
//  PasswordTextField.swift
//  gymx
//
//  Created by Mustafa Ghazi on 24/11/25.
//

import SwiftUI
import UIKit

struct PasswordTextField: View {
    
    @Binding var password: String
    @State private var isSecure: Bool = true
    var placeholder: LocalizedStringKey;
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "lock")
                .foregroundStyle(Color(hex: "7B6F72"))
            SecureToggleTextField(text: $password, placeholder: placeholder.localizedString, isSecure: isSecure)
            
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


struct SecureToggleTextField : UIViewRepresentable {
    @Binding var text: String
    var placeholder: String
    var isSecure: Bool
    
    func makeUIView(context: Context) ->  UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.isSecureTextEntry = isSecure
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.delegate = context.coordinator
        textField.setContentHuggingPriority(.defaultHigh, for: .vertical)
        textField.setContentCompressionResistancePriority(.required, for: .vertical)
        return textField
    }
    
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.text = text
        uiView.isSecureTextEntry = isSecure
    }
    func makeCoordinator() -> Coordinator { Coordinator(self) }
    
    class Coordinator: NSObject, UITextFieldDelegate {
           var parent: SecureToggleTextField
           init(_ parent: SecureToggleTextField) { self.parent = parent }

           func textFieldDidChangeSelection(_ textField: UITextField) {
               parent.text = textField.text ?? ""
           }
       }
}



extension LocalizedStringKey {
    var localizedString: String {
        // Extract key as string
        let mirror = Mirror(reflecting: self)
        if let key = mirror.descendant("key") as? String {
            return NSLocalizedString(key, comment: "")
        }
        return ""
    }
}
