//
//  ExploreController.swift
//  TwitterTutorial
//
//  Created by Алик on 15.03.2021.
//

import UIKit

class ExploreController: UIViewController {
    
    //MARK: - Properties
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super .viewDidLoad()
        
        congigureUI()
    }
    
    //MARK: - Helpers
    func congigureUI() {
        view.backgroundColor = .white
        
        navigationItem.title = "Explore"
    }
}
