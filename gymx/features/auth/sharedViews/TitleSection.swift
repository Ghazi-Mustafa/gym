//
//  TitleSection.swift
//  gymx
//
//  Created by Mustafa Ghazi on 24/11/25.
//

import SwiftUI

struct TitleSection: View {
    var title : LocalizedStringKey
    var descreption : LocalizedStringKey
    var body: some View {
        VStack(alignment: .center,spacing: 5){
            Text(title)
            Text(descreption)
                .font(.custom("Poppins-Bold", size: 20))
                .fontWeight(.bold)
        }
    }
}

