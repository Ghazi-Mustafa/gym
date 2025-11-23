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
    @Published  var navigateToSignup = false
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    let slides : [OnboardingSlideModel] = [
        OnboardingSlideModel(title: "Track Your Goal", descreption: "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals", imageName: "slide1Img"),
        OnboardingSlideModel(title: "Get Burn", descreption: "Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever", imageName: "slide2Img"),
        OnboardingSlideModel(title: "Eat Well", descreption: "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun", imageName: "slide3Img"),
        OnboardingSlideModel(title: "Improve Sleep Quality", descreption: "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning", imageName: "slide4Img")
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
            
            navigateToSignup = true
            isFirstLaunch = false
            
        } else {
            nextSlide()
        }
    }
}
