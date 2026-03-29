//
//  AppLayout.swift
//  gymx
//
//  Created by Mustafa Ghazi on 23/03/26.
//

import SwiftUI
import Combine
struct AppLayout: View {
    @State private var selectedTab: Tabs = .home
        @StateObject private var coordinator: AppLayoutCoordinator
        
        init() {
            _coordinator = StateObject(wrappedValue: DIContainer.shared.resolve(AppLayoutCoordinator.self))
        }
        
        var body: some View {
            VStack(spacing: 0) {
                Group {
                    switch selectedTab {
                    case .home:
                        HomeView(vm: coordinator.homeVM())
                    case .search:
                        Text("search")
                    case .setting:
                        Text("setting")
                    case .activity:
                        Text("activity")
                    case .camera:
                        Text("camera")
                    }
                }.frame(maxWidth: .infinity,maxHeight: .infinity)
                
                CustomTabView(selectedTab: $selectedTab)
            }
        }
}

#Preview {
    AppLayout()
}


// Home
struct HomeView: View {
    @ObservedObject var vm: HomeViewModel
    
    var body: some View {
        Group {
            if !vm.hasLoaded {
                Text("Loading...")
                    .onAppear { vm.loadDataIfNeeded() }
            } else {
                List(vm.data, id: \.self) { item in
                    Text(item)
                }
            }
        }
    }
}

final class HomeViewModel: ObservableObject {
    @Published var data: [String] = []
    var hasLoaded = false
    
    init() { print("HomeViewModel init") }
    
    func loadDataIfNeeded() {
        guard !hasLoaded else { return }
        hasLoaded = true
        print("Home data Loading")
        data = ["Home 1", "Home 2", "Home 3"]
    }
}

// Search
struct SearchView: View {
    @ObservedObject var vm: SearchViewModel
    
    var body: some View {
        Group {
            if !vm.hasLoaded {
                Text("Loading...")
                    .onAppear { vm.loadDataIfNeeded() }
            } else {
                List(vm.data, id: \.self) { item in
                    Text(item)
                }
            }
        }
    }
}

final class SearchViewModel: ObservableObject {
    
    @Published var data: [String] = []
    var hasLoaded = false
    
    init() { print("SearchViewModel init") }
    
    func loadDataIfNeeded() {
        guard !hasLoaded else { return }
        hasLoaded = true
        print("Search data Loading")
        data = ["Search 1", "Search 2", "Search 3"]
    }
}

// Settings
struct SettingsView: View {
    @ObservedObject var vm: SettingsViewModel
    
    var body: some View {
        Group {
            if !vm.hasLoaded {
                Text("Loading...")
                    .onAppear { vm.loadDataIfNeeded() }
            } else {
                List(vm.data, id: \.self) { item in
                    Text(item)
                }
            }
        }
    }
}

final class SettingsViewModel: ObservableObject {
    @Published var data: [String] = []
    var hasLoaded = false
    
    init() { print("SettingsViewModel init") }
    
    func loadDataIfNeeded() {
        guard !hasLoaded else { return }
        hasLoaded = true
        print("Settings data Loading")
        data = ["Settings 1", "Settings 2"]
    }
}
