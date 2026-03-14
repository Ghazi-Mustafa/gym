//
//  DontHaveAccountRow.swift
//  gymx
//
//  Created by Mustafa Ghazi on 05/03/26.
//
import SwiftUI
struct DontHaveAccountRow : View {
    @EnvironmentObject var routing : Router<AuthRoutes>
    var body : some View {
        HStack {
            Text(L10n.Auth.dontHaveAccountYet.localized)
                .font(.custom("Poppins-Regular", size: 14))
                .fontWeight(.regular)
                .fontWeight(.medium)
            Button {
                routing.push(.signup)
            } label: {
                Text(L10n.Auth.register.localized)
                    .foregroundStyle(LinearGradient(colors: [
                        Color(hex: "EEA4CE"),
                        Color(hex: "C58BF2")
                    ], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .font(.custom("Poppins-Medium", size: 14))
                    .fontWeight(.medium)
            }

        }
        .padding(.vertical)
    }
}
