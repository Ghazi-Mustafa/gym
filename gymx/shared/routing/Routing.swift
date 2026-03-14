//
//  Routing.swift
//  gymx
//
//  Created by Mustafa Ghazi on 13/01/26.
//

import SwiftUI
import Combine


final class Router<Route: Hashable>: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(_ route: Route) {
        path.append(route)
    }
    
    func pushReplacement(_ route: Route) {
        path = NavigationPath()
        path.append(route)
    }
    
    func pop() {
        if !path.isEmpty { path.removeLast() }
    }
    
    func popToRoot() {
        path = NavigationPath()
    }
}
