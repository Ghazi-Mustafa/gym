//
//  OnboardingSlideView.swift
//  gymx
//
//  Created by Mustafa Ghazi on 05/11/25.
//

import SwiftUI

struct OnboardingSlideView: View {
    var slide : OnboardingSlideModel
    var body: some View {
        VStack(alignment:.leading,spacing:64){
            Image(slide.imageName)
                .resizable()
                .scaledToFill()
                .frame(maxHeight: .infinity)
            VStack(alignment: .leading,spacing: 15){
                Text(slide.title)
                    .font(.custom("Poppins-Bold", size: 24))
                    .fontWeight(.bold)
                Text(slide.descreption)
                    .font(.custom("Poppins-Regular", size: 14))
                    .foregroundStyle(Color(red: 123/255, green: 111/255, blue: 114/255))
                    .fontWeight(.regular)
            }
            .padding(.horizontal,30)
            .frame(maxWidth: .infinity,alignment: .top)
            .frame(maxHeight: .infinity,alignment: .top)
        }
        
    }
}

#Preview {
    OnboardingSlideView(slide: OnboardingSlideModel(title: "test1", descreption: "test", imageName: "slide1Img"))
}
