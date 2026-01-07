//
//  gymxApp.swift
//  gymx
//
//  Created by Mustafa Ghazi on 05/11/25.
//

import SwiftUI
import FirebaseCore

@main
struct gymxApp: App {
    
    
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    @State private var showOnboarding: Bool = true
    init() {
         // Initialize showOnboarding with the current AppStorage value
         _showOnboarding = State(initialValue: isFirstLaunch)
        FirebaseApp.configure()
     }
    var body: some Scene {
        WindowGroup {
            Group {
                if showOnboarding{
                    OnboardingView(isFirstLaunch: $isFirstLaunch)
                }else{
                    SignupView()
                }
            }
            .onAppear {
                showOnboarding = isFirstLaunch
            }
            
        }
        
        
        
        
    }
    
    
}




