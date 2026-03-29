//
//  Tabs.swift
//  gymx
//
//  Created by Mustafa Ghazi on 23/03/26.
//

enum Tabs: CaseIterable {
    case home
    case activity
    case search
    case camera
    case setting
    
    var icon: String {
        switch self {
        case .home: return "house"
        case .search: return "magnifyingglass"
        case .setting: return "gear"
        case .activity: return "figure.disc.sports"
        case .camera: return "camera"
            
        }
    }
}
