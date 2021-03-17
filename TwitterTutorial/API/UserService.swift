//
//  UserService.swift
//  TwitterTutorial
//
//  Created by Алик on 17.03.2021.
//

import Firebase

struct UserService {
    
    static let shared = UserService()
    private init() {}
    
    func fetchUser(completion: @escaping(User) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }

            let user = User(uid: uid, dictionary: dictionary)
            completion(user)
        }
    }
}
