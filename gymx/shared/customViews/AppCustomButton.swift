//
//  AppCustomButton.swift
//  gymx
//
//  Created by Mustafa Ghazi on 24/11/25.
//

import SwiftUI

struct AppCustomButton: View {
    let title : LocalizedStringKey
    var isDisabled : Bool
    var isLoading : Bool
    let onTap : ()-> ()
    private var backgroundColors: [Color] {
        isDisabled ? [Color.gray] : [Color(hex: "9DCEFF"), Color(hex: "92A3FD")]
    }
    var body: some View {
        Button {
            onTap()
        } label: {
            ZStack{
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                }else{
                    Text(title)
                }
            }
            .padding()
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .font(.custom("Poppins-Bold", size: 18))
            .fontWeight(.bold)
            .background(LinearGradient(colors: backgroundColors
                                       , startPoint: .topLeading, endPoint: .bottomTrailing)
                .animation(.easeInOut(duration: 0.2), value: isDisabled)
                .opacity(isDisabled ? 0.7 : 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }.frame(maxWidth: 400)
            .disabled(isDisabled)
            .buttonStyle(.plain)
            .animation(.easeInOut(duration: 0.2), value: isDisabled)
    }
}
