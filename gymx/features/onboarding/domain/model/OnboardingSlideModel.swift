//
//  OnboardingSlideModel.swift
//  gymx
//
//  Created by Mustafa Ghazi on 05/11/25.
//

import SwiftUI

struct OnboardingSlideModel : Identifiable{
    let id = UUID()
    let title : LocalizedStringKey
    let descreption : LocalizedStringKey
    let imageName:String
    
}

