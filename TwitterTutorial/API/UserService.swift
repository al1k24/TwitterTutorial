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
    
    func fetchUser(uid: String, completion: @escaping(User) -> Void) {
        REF_USERS.child(uid).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }

            let user = User(uid: uid, dictionary: dictionary)
            completion(user)
        }
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void) {
        var users = [User]()
        
        REF_USERS.observe(.childAdded) { snapshop in
            guard let dictionary = snapshop.value as? [String: AnyObject] else { return }
            
            let uid = snapshop.key
            let user = User(uid: uid, dictionary: dictionary)
            users.append(user)
            
            completion(users)
        }
    }
}
