//
//  OnboardingViewModel.swift
//  gymx
//
//  Created by Mustafa Ghazi on 05/11/25.
//

import SwiftUI
import Combine


class OnboardingViewModel : ObservableObject{
    @Published var currentIndex : Int = 0
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    let slides : [OnboardingSlideModel] = [
        OnboardingSlideModel(title: L10n.Onboarding.slide1Title.localized, descreption: L10n.Onboarding.slide1Desc.localized, imageName: "slide1Img"),
        OnboardingSlideModel(title: L10n.Onboarding.slide2Title.localized, descreption: L10n.Onboarding.slide2Desc.localized, imageName: "slide2Img"),
        OnboardingSlideModel(title: L10n.Onboarding.slide3Title.localized, descreption: L10n.Onboarding.slide3Desc.localized, imageName: "slide3Img"),
        OnboardingSlideModel(title: L10n.Onboarding.slide4Title.localized, descreption: L10n.Onboarding.slide4Desc.localized, imageName: "slide4Img")
    ]
    var isLastSlide : Bool{
        currentIndex == slides.count - 1
    }
    
    func nextSlide(){
        if !isLastSlide{
            currentIndex += 1
        }
    }
    
    func handlePageViewState(){
        if isLastSlide {
            isFirstLaunch = false
            
        } else {
            nextSlide()
        }
    }
}
