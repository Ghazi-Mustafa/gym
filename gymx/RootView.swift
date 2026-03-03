//
//  RootView.swift
//  gymx
//
//  Created by Mustafa Ghazi on 13/01/26.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var router : Routing
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    var body: some View {
        NavigationStack(path: $router.path) {
            if isFirstLaunch {
                OnboardingView()
                    .navigationBarHidden(true)
            } else if isLoggedIn {
                LoginView()
            } else {
                LoginView()
                    .navigationTitle("Login")
            }
        }
        .navigationDestination(for: Routes.self) { route in
            switch route {
            case .home : LoginView()
            case .login : LoginView()
            case .onboarding : OnboardingView()
            case .signup : SignupView()
            }
        }
        
    }
}

#Preview {
    RootView()
}
