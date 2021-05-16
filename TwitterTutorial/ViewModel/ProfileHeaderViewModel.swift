//
//  ProfileHeaderViewModel.swift
//  TwitterTutorial
//
//  Created by Alik on 10.05.2021.
//

import UIKit

enum ProfileFilterOptions: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var description: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Tweets & Replies"
        case .likes: return "Likes"
        }
    }
}

struct ProfileHeaderViewModel {
    
    private let user: User
    
    let usernameText: String
    
    var followersString: NSAttributedString? {
        let followers = user.stats?.followers ?? 0
        return attributedText(withValue: followers, text: "followers")
    }
    
    var followingString: NSAttributedString? {
        let following = user.stats?.following ?? 0
        return attributedText(withValue: following, text: "following")
    }
    
    var actionButtonTitle: String {
        if user.isCurrentUser {
            return "Edit Profile"
        }
        
        if !user.isFollowed && !user.isCurrentUser {
            return "Following"
        }
        
        if user.isFollowed {
            return "Following"
        }
        
        return "Loading"
    }
    
    init(user: User) {
        self.user = user
        self.usernameText = "@" + user.userName
    }
    
    fileprivate func attributedText(withValue value: Int, text: String) -> NSAttributedString {
        let attributedTitle = NSMutableAttributedString(string: "\(value)", attributes: [
            .font: UIFont.boldSystemFont(ofSize: 14)
        ])
        
        attributedTitle.append(NSMutableAttributedString(string: " \(text)", attributes: [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.lightGray
        ]))
        
        return attributedTitle
    }
}
