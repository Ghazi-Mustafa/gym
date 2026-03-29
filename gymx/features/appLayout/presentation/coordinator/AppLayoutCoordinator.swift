//
//  AppLayoutCoordinator.swift
//  gymx
//
//  Created by Mustafa Ghazi on 23/03/26.
//
import Combine
class AppLayoutCoordinator: ObservableObject {
       
   private var homeVm: HomeViewModel?
   private var searchVm: SearchViewModel?
   private var settingVm: SettingsViewModel?
   
   func homeVM() -> HomeViewModel {
       if let vm = homeVm { return vm }
       let vm = DIContainer.shared.resolve(HomeViewModel.self)
       homeVm = vm
       return vm
   }
   
   func searchVM() -> SearchViewModel {
       if let vm = searchVm { return vm }
       let vm = DIContainer.shared.resolve(SearchViewModel.self)
       searchVm = vm
       return vm
   }
   
   func settingVM() -> SettingsViewModel {
       if let vm = settingVm { return vm }
       let vm = DIContainer.shared.resolve(SettingsViewModel.self)
       settingVm = vm
       return vm
   }
}
