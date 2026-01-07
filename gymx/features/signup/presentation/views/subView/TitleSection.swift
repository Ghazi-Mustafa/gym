//
//  TitleSection.swift
//  gymx
//
//  Created by Mustafa Ghazi on 24/11/25.
//

import SwiftUI

struct TitleSection: View {
    var body: some View {
        VStack(alignment: .center,spacing: 5){
            Text(LocaleKeys.Signup.heyThere)
            Text(LocaleKeys.Signup.createAccount)
                .font(.custom("Poppins-Bold", size: 20))
                .fontWeight(.bold)
        }
    }
}

