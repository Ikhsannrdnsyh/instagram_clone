//
//  ProfileCell.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 21/10/24.
//

import UIKit

class ProfileCell: UICollectionViewCell{
    //MARK: Properties
    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = UIImage(systemName: "person.fill")
        
        return iv
    }()
    
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
        backgroundColor = .white
        
        addSubview(postImageView)
        postImageView.fillSuperview()
    }
}