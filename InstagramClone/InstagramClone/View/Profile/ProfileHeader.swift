//
//  ProfileHeader.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 21/10/24.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    //MARK: Properties
    
    //MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) has not been implemented")
    }
    
    //MARK: configure UI
    private func configureUI(){
        backgroundColor = .lightGray
    }
}
