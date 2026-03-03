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
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @StateObject var routing = Routing()
    init() {
        FirebaseApp.configure()
     }
    var body: some Scene {
        WindowGroup {
                ZStack{
                    if isFirstLaunch {
                        NavigationStack(path: $routing.path) {
                            OnboardingView()
                                .navigationBarHidden(true)
                                .transition(.move(edge: .leading))
                        }
                    } else if isLoggedIn {
                        LoginView()
                            .transition(.move(edge: .trailing))
                    } else {
                        NavigationStack(path: $routing.path) {
                            LoginView()
                                .navigationTitle("Login")
                                .navigationBarHidden(false)
                                .transition(.move(edge: .trailing))
                        }
                    }
                }
            .navigationTitle("test")
            .navigationDestination(for: Routes.self) { route in
                switch route {
                case .home : LoginView()
                case .login : LoginView()
                case .onboarding : OnboardingView()
                case .signup : SignupView()
                }
            }
            .animation(.easeInOut, value: [isFirstLaunch,isLoggedIn])
            .environmentObject(routing)
        }
    }
}

