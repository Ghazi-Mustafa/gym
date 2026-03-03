//
//  AppCustomButton.swift
//  gymx
//
//  Created by Mustafa Ghazi on 24/11/25.
//

import SwiftUI

struct AppCustomButton: View {
    let title : LocalizedStringKey
    let onTap : ()-> ()
    var body: some View {
        Button {
            onTap()
        } label: {
            Text(title)
                .padding()
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .font(.custom("Poppins-Bold", size: 18))
                .fontWeight(.bold)
                .background(LinearGradient(colors: [
                    Color(hex: "9DCEFF"),
                    Color(hex: "92A3FD")
                ], startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(RoundedRectangle(cornerRadius: 20))
               
        }.frame(maxWidth: 400)
    }
}
