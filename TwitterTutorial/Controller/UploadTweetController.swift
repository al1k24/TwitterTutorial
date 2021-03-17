//
//  UploadTweetController.swift
//  TwitterTutorial
//
//  Created by Алик on 17.03.2021.
//

import UIKit

class UploadTweetController: UIViewController {
    
    //MARK: - Properties
    private lazy var actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .twitterBlue
        button.setTitle("Tweet", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        
        button.frame = CGRect(x: 0, y: 0, width: 64, height: 32)
        button.layer.cornerRadius = 32 / 2
        
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: - Lifecycle
    deinit { print("* UploadTweetController - deinit") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    //MARK: - Selectors
    @objc func cancelBarButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func actionButtonTapped() {
        print(#function)
    }
    
    //MARK: - API
    
    //MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelBarButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: actionButton)
    }
}
