//
//  FeedController.swift
//  TwitterTutorial
//
//  Created by Алик on 15.03.2021.
//

import UIKit

class FeedController: UIViewController {
    
    //MARK: - Properties
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super .viewDidLoad()
        
        congigureUI()
    }
    
    //MARK: - Helpers
    func congigureUI() {
        view.backgroundColor = .white
        
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
}
