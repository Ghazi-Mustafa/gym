//
//  NextButtonView.swift
//  gymx
//
//  Created by Mustafa Ghazi on 23/11/25.
//

import SwiftUI


struct NextButtonView : View {
    let isLastSlide : Bool
    let size : CGFloat
    let action : () -> Void
    var body: some View {
        Button(action: {
            action()
        }) {
            if isLastSlide {
                Text(L10n.Onboarding.getStarted.localized)
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(colors: [
                        Color(hex: "9DCEFF"),
                        Color(hex: "92A3FD")
                    ], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(.capsule)
            }else{
                Image(systemName: "arrow.right")
                    .bold()
                    .padding()
                    .frame(width: size, height: size)
                    .background(LinearGradient(colors: [
                        Color(hex: "9DCEFF"),
                        Color(hex: "92A3FD")
                    ], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .foregroundColor(.white)
                    .clipShape(.circle)
                
                
            }
        }
        
    }
    
    
}
