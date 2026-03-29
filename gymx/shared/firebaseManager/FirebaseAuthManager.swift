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
    @Published var isProfileComplete : Bool?
    private var handle : AuthStateDidChangeListenerHandle?
    private var firestoreClient : FirestoreClient
    init(firestoreClient : FirestoreClient) {
        user = Auth.auth().currentUser
        self.firestoreClient = firestoreClient
        listen()
    }
    
    private func listen(){
        handle = Auth.auth().addStateDidChangeListener {[weak self] _, user in
            self?.user = user
            Task {
                await self?.checkProfile()
            }
        }
    }
    
    deinit {
        if let handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    func checkProfile()async{
        guard let uid = user?.uid else{
            isProfileComplete = false
            return
        }
        do{
            let profile = try await firestoreClient.load(UserModel.self, docId: uid, path: "users")
            isProfileComplete = profile.email != nil && profile.gender != nil && profile.height != nil
        }catch{
            isProfileComplete = false
        }
    }
}
