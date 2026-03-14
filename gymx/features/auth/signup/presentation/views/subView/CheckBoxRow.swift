//
//  CheckBoxRow.swift
//  gymx
//
//  Created by Mustafa Ghazi on 24/11/25.
//

import SwiftUI

struct CheckBoxRow: View {
    @Binding var isChecked: Bool
    var body: some View {
        HStack(spacing: 10){
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .onTapGesture {
                    isChecked.toggle()
                }
                .foregroundStyle(isChecked ? Color(hex: "92A3FD") : Color(hex: "ADA4A5"))
            Text(L10n.Auth.byContinuingAccept.localized)
                
                .font(.custom("Poppins-Regular", size: 10))
            
        }
        .foregroundStyle(Color(hex: "ADA4A5"))
    }
}

#Preview {
    CheckBoxRow(isChecked: .constant(true))
}
