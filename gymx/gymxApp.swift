//
//  gymxApp.swift
//  gymx
//
//  Created by Mustafa Ghazi on 05/11/25.
//

import SwiftUI

@main
struct gymxApp: App {
    
    
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    @State private var showOnboarding: Bool = true
    var body: some Scene {
        WindowGroup {
            Group {
                if showOnboarding{
                    OnboardingView(isFirstLaunch: $isFirstLaunch)
                }else{
                    LoginView()
                }
            }
            .onAppear {
                showOnboarding = isFirstLaunch
            }
            
        }
        
        
        
        
    }
    
    
}




