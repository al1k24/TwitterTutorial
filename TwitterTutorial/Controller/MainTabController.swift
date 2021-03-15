//
//  MainTabController.swift
//  TwitterTutorial
//
//  Created by Алик on 15.03.2021.
//

import UIKit

class MainTabController: UITabBarController {
    
    //MARK: - Properties
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewControllers()
    }
    
    //MARK: Helpers
    
    func configureViewControllers() {
        let feed = FeedController()
        let navFeed = templateNavigationController(image: "home_unselected", rootViewController: feed)
        
        let explore = ExploreController()
        let navExplore = templateNavigationController(image: "search_unselected", rootViewController: explore)
        
        let notifications = NotificationsController()
        let navNotifications = templateNavigationController(image: "like_unselected", rootViewController: notifications)
        
        let conversations = ConversationsController()
        let navConversations = templateNavigationController(image: "home_unselected", rootViewController: conversations)
        
        viewControllers = [navFeed, navExplore, navNotifications, navConversations]
    }
    
    func templateNavigationController(image: String, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = UIImage(named: image)
        nav.navigationBar.tintColor = .white
        return nav
    }

}
