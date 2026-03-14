//
//  ViewStates.swift
//  gymx
//
//  Created by Mustafa Ghazi on 10/03/26.
//

enum ViewState<T>{
    case idle
    case loading
    case success(T)
    case failure(Error)
}

extension ViewState {
    var isLoading : Bool {
        switch self {
        case .loading:
            return true
        default:
            return false
        }
    }
    var isSuccess : Bool {
        switch self {
        case .success:
            return true
        default:
            return false
        }
    }
    
    var isFailure : Bool {
        switch self {
        case .failure:
            return true
        default:
            return false
        }
    }
}
