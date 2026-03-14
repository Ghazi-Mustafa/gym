//
//  AuthOptions.swift
//  gymx
//
//  Created by Mustafa Ghazi on 24/11/25.
//

import SwiftUI

struct AuthOptions: View {
    var onGoogleTap : () -> Void
    var body: some View {
        HStack(spacing: 30){
            Image(systemName: "apple.logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 24,maxHeight: 24)
                .padding()
                .background(RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(hex: "DDDADA"))
                    .foregroundStyle(.clear)
                    
                )
            Image("googleLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 24,maxHeight: 24)
                .padding()
                .background(RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(hex: "DDDADA"))
                    .foregroundStyle(.clear)
                )
                .onTapGesture {
                    onGoogleTap()
                }
            
        }

      
    }
}

#Preview {
    AuthOptions(onGoogleTap: {})
}
