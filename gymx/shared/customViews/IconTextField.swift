//
//  IconTextField.swift
//  gymx
//
//  Created by Mustafa Ghazi on 23/11/25.
//

import SwiftUI
enum FieldMode {
    case secure
    case visible
}

struct IconTextField: View {
    @Binding var text : String
    @State private var isTrailingIconChanged = false
    let leadingIcon : String
    let placeHolder : LocalizedStringKey
    var trailingIcon : String? = nil
    var tappedTrailingIcon : String? = nil
    var hasError : Bool = false
    
    
    init(placeHolder: LocalizedStringKey,text: Binding<String>, leadingIcon: String, trailingIcon : String? = nil,tappedTrailingIcon:String? = nil,hasError:Bool = false) {
        self.placeHolder = placeHolder
        self._text = text
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.tappedTrailingIcon = tappedTrailingIcon
        self.hasError = hasError
    }
    var body: some View {
        HStack(spacing: 15){
            Image(systemName: leadingIcon)
                .foregroundStyle(Color(hex: "7B6F72"))
            ZStack(alignment: .leading){
                if text.isEmpty{
                    Text(placeHolder)
                        .foregroundColor(Color(hex: "ADA4A5"))
                    
                }
                TextField("", text: $text)
            }
            
            if let trailingIcon = trailingIcon{
                if let tappedTrailingIcon = tappedTrailingIcon {
                    Image(systemName: isTrailingIconChanged ? trailingIcon : (tappedTrailingIcon))
                        .foregroundStyle(Color(hex: "7B6F72"))
                        .onTapGesture {
                            isTrailingIconChanged.toggle()
                        }
                }else{
                    Image(systemName: trailingIcon)
                        .foregroundStyle(Color(hex: "7B6F72"))
                        .onTapGesture {
                            
                        }
                }
                
            }
        }
        .padding()
        .listRowInsets(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
        .listRowSeparator(.hidden)
        .background(Color(hex: "F7F8F8"))
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(hasError ? Color.red:Color.clear, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 14))
        
    }
    
}







