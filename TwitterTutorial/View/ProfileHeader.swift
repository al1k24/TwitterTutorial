//
//  ProfileHeader.swift
//  TwitterTutorial
//
//  Created by Alik on 10.05.2021.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
