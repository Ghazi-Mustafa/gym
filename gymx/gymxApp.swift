//
//  gymxApp.swift
//  gymx
//
//  Created by Mustafa Ghazi on 05/11/25.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

@main
struct gymxApp: App {
    
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    @StateObject private var firebaseAuthManager : FirebaseAuthManager
    @StateObject var mainRouting = Router<MainRoutes>()
    @StateObject var authRouting = Router<AuthRoutes>()
    init() {
        FirebaseApp.configure()
        setupDi()
        _firebaseAuthManager = StateObject(wrappedValue: DIContainer.shared.resolve(FirebaseAuthManager.self))
        setupGoogleSigninConfiguration()
    }
    
    private func setupGoogleSigninConfiguration(){
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
    }
    
    var body: some Scene {
        WindowGroup {
            if isFirstLaunch{
                OnboardingView()
            }else if firebaseAuthManager.user != nil{
                if firebaseAuthManager.isProfileComplete ?? false{
                    NavigationStack(path: $mainRouting.path) {
                        Button {
                           try? Auth.auth().signOut()
                        } label: {
                            Text("signOut")
                        }
                            .navigationDestination(for: MainRoutes.self) { route in
                                switch route {
                                case .home: Button {
                                   try? Auth.auth().signOut()
                                } label: {
                                    Text("signOut")
                                }

                                }
                            }
                    }
                    .environmentObject(mainRouting)
                    .environmentObject(firebaseAuthManager)
                }
                else{
                AppLayout()
//                    NavigationStack(path: $mainRouting.path) {
//                        Button {
//                            try? Auth.auth().signOut()
//                        } label: {
//                            Text("CompleteProfile")
//                        }
//                            .navigationDestination(for: MainRoutes.self) { route in
//                                switch route {
//                                case .home: Button {
//                                   
//                                } label: {
//                                    Text("CompleteProfile")
//                                }
//
//                                }
//                            }
//                    }
                }
            }else{
                NavigationStack(path: $authRouting.path) {
                    LoginView()
                        .navigationDestination(for: AuthRoutes.self) { route in
                            switch route {
                            case .login : LoginView()
                            case .signup : SignupView()
                            }
                        }
                }
                .environmentObject(authRouting)
                .environmentObject(firebaseAuthManager)
                .onOpenURL{ url in
                    GIDSignIn.sharedInstance.handle(url)
                }
            }

        }
        
    }
}

