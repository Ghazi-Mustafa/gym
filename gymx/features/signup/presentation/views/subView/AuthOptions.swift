//
//  AuthOptions.swift
//  gymx
//
//  Created by Mustafa Ghazi on 24/11/25.
//

import SwiftUI

struct AuthOptions: View {
    var body: some View {
        HStack(spacing: 30){
            Image(systemName: "person")
                .padding()
                .background(RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(hex: "DDDADA"))
                    .foregroundStyle(.clear)
                    
                )
            Image(systemName: "person")
                .padding()
                .background(RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(hex: "DDDADA"))
                    .foregroundStyle(.clear)
                    
                )
        }
    }
}

#Preview {
    AuthOptions()
}
