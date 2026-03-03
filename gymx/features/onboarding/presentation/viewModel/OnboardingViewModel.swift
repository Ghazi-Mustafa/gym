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
        OnboardingSlideModel(title: LocaleKeys.Onboarding.slide1Title, descreption: LocaleKeys.Onboarding.slide1Desc, imageName: "slide1Img"),
        OnboardingSlideModel(title: LocaleKeys.Onboarding.slide2Title, descreption: LocaleKeys.Onboarding.slide2Desc, imageName: "slide2Img"),
        OnboardingSlideModel(title: LocaleKeys.Onboarding.slide3Title, descreption: LocaleKeys.Onboarding.slide3Desc, imageName: "slide3Img"),
        OnboardingSlideModel(title: LocaleKeys.Onboarding.slide4Title, descreption: LocaleKeys.Onboarding.slide4Desc, imageName: "slide4Img")
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
