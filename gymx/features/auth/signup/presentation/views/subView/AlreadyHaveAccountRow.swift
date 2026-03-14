//
//  AlreadyHaveAccountRow.swift
//  gymx
//
//  Created by Mustafa Ghazi on 24/11/25.
//

import SwiftUI

struct AlreadyHaveAccountRow: View {
    @EnvironmentObject var routing : Router<AuthRoutes>
    var body: some View {
        HStack(spacing: 5){
            Text(L10n.Auth.alreadyHaveAccount.localized)
                .font(.custom("Poppins-Regular", size: 14))
                .fontWeight(.regular)
                .fontWeight(.medium)

            Button {
                routing.push(.login)
            } label: {

                Text(L10n.Auth.login.localized)
                    .foregroundStyle(LinearGradient(colors: [
                        Color(hex: "EEA4CE"),
                        Color(hex: "C58BF2")
                    ], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .font(.custom("Poppins-Medium", size: 14))
                    .fontWeight(.medium)
            }

        }
    }
}

#Preview {
    AlreadyHaveAccountRow()
}
