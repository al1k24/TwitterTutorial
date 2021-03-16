//
//  MainTabController.swift
//  TwitterTutorial
//
//  Created by Алик on 15.03.2021.
//

import UIKit
import Firebase

class MainTabController: UITabBarController {
    
    //MARK: - Properties
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

//        logUserOut()
        authenticateUserAndConfigureUI()
        
    }
    
    //MARK: - API
    func authenticateUserAndConfigureUI() {
        view.backgroundColor = .twitterBlue
        
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        } else {
            configureViewControllers()
            configureUI()
        }
    }
    
    func logUserOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("* DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    //MARK: - Selectors
    @objc func actionButtonTapped() {
        print(#function)
    }
    
    //MARK: Helpers
    
    func configureUI() {
        view.addSubview(actionButton)
//        actionButton.translatesAutoresizingMaskIntoConstraints = false
//        actionButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
//        actionButton.widthAnchor.constraint(equalToConstant: 56).isActive = true
//        actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -64).isActive = true
//        actionButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor,
                            right: view.rightAnchor,
                            paddingBottom: 64,
                            paddingRight: 16,
                            width: 56,
                            height: 56)
        actionButton.layer.cornerRadius = 56 / 2 //height / 2
    }
    
    func configureViewControllers() {
        let feed = FeedController()
        let navFeed = templateNavigationController(image: "home_unselected", rootViewController: feed)
        
        let explore = ExploreController()
        let navExplore = templateNavigationController(image: "search_unselected", rootViewController: explore)
        
        let notifications = NotificationsController()
        let navNotifications = templateNavigationController(image: "like_unselected", rootViewController: notifications)
        
        let conversations = ConversationsController()
        let navConversations = templateNavigationController(image: "ic_mail_outline_white_2x-1", rootViewController: conversations)
        
        viewControllers = [navFeed, navExplore, navNotifications, navConversations]
    }
    
    func templateNavigationController(image: String, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = UIImage(named: image)
        nav.navigationBar.tintColor = .white
        return nav
    }

}
