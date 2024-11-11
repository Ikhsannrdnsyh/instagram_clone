//
//  CommentCell.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 11/11/24.
//

import UIKit

class CommentCell: UICollectionViewCell {
    //MARK: Properties
    
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.backgroundColor = .systemGray
        iv.tintColor = .white
        iv.image = UIImage(systemName: "person.fill")
        
        return iv
    }()
    
    private let commentLabel: UILabel = {
        let label = UILabel()
        let attrString = NSMutableAttributedString(string: "username ", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        attrString.append(NSAttributedString(string: "Comment for this post...", attributes: [.font: UIFont.systemFont(ofSize: 14)]))
        
        label.attributedText = attrString
        return label
    }()
    
    //MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Config UI
    private func configureUI(){
        backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 16)
        profileImageView.setDimensions(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 40 / 2
        
        commentLabel.numberOfLines = 0
        addSubview(commentLabel)
        commentLabel.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 8)
        commentLabel.anchor(right: rightAnchor, paddingRight: 16)
    }
    
    
}
