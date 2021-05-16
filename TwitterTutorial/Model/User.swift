//
//  User.swift
//  TwitterTutorial
//
//  Created by Алик on 17.03.2021.
//

import Foundation
import Firebase

struct User {
    let uid: String
    let email: String
    let fullName: String
    let userName: String
    var profileImageUrl: URL?
    var isFollowed: Bool = false
    
    var isCurrentUser: Bool {
        return Auth.auth().currentUser?.uid == uid
    }
    
    init(uid: String, dictionary: [String: AnyObject]) {
        self.uid = uid
        
        self.email = dictionary["email"] as? String ?? ""
        self.fullName = dictionary["fullName"] as? String ?? ""
        self.userName = dictionary["userName"] as? String ?? ""
        
        if let profileImageUrlString = dictionary["profileImageUrl"] as? String {
            guard let url = URL(string: profileImageUrlString) else { return }
            self.profileImageUrl = url
        }
    }
}
