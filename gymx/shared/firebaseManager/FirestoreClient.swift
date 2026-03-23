//
//  FirestoreClient.swift
//  gymx
//
//  Created by Mustafa Ghazi on 18/03/26.
//

import FirebaseCore
import FirebaseFirestore

final class FirestoreClient {
    let db = Firestore.firestore()
    
    func save<T>(object:T,path:String)async throws where T : Codable & Identifiable ,T.ID == String{
        let docRef = db.collection(path).document(object.id)
        let data = try JSONEncoder().encode(object)
        let dic = try JSONSerialization.jsonObject(with: data) as? [String : Any] ?? [:]
        try  await docRef.setData(dic, merge: true)
    }
    
    func load<T>(_ type:T.Type,docId:String,path:String)async throws -> T where T:Codable&Identifiable,T.ID==String{
        let docRef = db.collection(path).document(docId)
        let snapchot = try await docRef.getDocument()
        guard let data = snapchot.data() else{
            throw NSError(domain: "No document found", code: 404)
        }
        let jsonData = try JSONSerialization.data(withJSONObject: data)
        let object = try JSONDecoder().decode(T.self, from: jsonData)
        return object
        
    }
}
