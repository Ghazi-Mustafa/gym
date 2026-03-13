//
//  FirebaseAuthManager.swift
//  gymx
//
//  Created by Mustafa Ghazi on 12/03/26.
//

import Combine
import FirebaseAuth

final class FirebaseAuthManager : ObservableObject {
    @Published var user : User?
    private var handle : AuthStateDidChangeListenerHandle?
    init() {
        user = Auth.auth().currentUser
        listen()
    }
    
    private func listen(){
        handle = Auth.auth().addStateDidChangeListener {[weak self] _, user in
            self?.user = user
        }
    }
    
    deinit {
        if let handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
}
