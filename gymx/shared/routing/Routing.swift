//
//  Routing.swift
//  gymx
//
//  Created by Mustafa Ghazi on 13/01/26.
//

import SwiftUI
import Combine


final class Routing : ObservableObject{
    
    @Published var path = NavigationPath()
    
    func push(_ route: Routes) {
        path.append(route)
    }
    
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func popToRoot() {
        path = NavigationPath()
    }
    
    func setInitialRoute(isFirstLaunch: Bool, isLoggedIn: Bool) {
        popToRoot()
        if isFirstLaunch {
            push(.onboarding)
        } else {
            push(isLoggedIn ? .home : .login)
        }
    }
}
