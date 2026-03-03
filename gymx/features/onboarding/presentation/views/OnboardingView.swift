//
//  OnboardingView.swift
//  gymx
//
//  Created by Mustafa Ghazi on 05/11/25.
//

import SwiftUI

struct OnboardingView: View {
    
    @ObservedObject var viewModel = OnboardingViewModel()
    @EnvironmentObject var routing : Routing
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            TabView(selection: $viewModel.currentIndex) {
                ForEach(0..<viewModel.slides.count,id: \.self) { index in
                    OnboardingSlideView(slide: viewModel.slides[index])
                        .ignoresSafeArea()
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            
            ZStack{
                if !viewModel.isLastSlide{
                    ProgressCircleView(progress: CGFloat(viewModel.currentIndex+1) / CGFloat(viewModel.slides.count), size: 70)
                }
                
                NextButtonView(isLastSlide: viewModel.isLastSlide,size: 60,action: {
                    viewModel.handlePageViewState()
                    
                    
                })
            }
            .padding(.horizontal,40)
            .padding(.vertical,45)
            
        }
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .navigationBar)
        .ignoresSafeArea(.all)
    }
    
}

extension View {
    func localizedAlignment(_ locale: Locale) -> some View {
        let isArabic = locale.identifier.hasPrefix("ar")
                return self
                    .frame(maxWidth: .infinity, alignment: isArabic ? .trailing : .leading)
                    .multilineTextAlignment(isArabic ? .trailing : .leading)
    }
}

#Preview {
    OnboardingView()

}
