//
//  CustomInputAccesoryView.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 11/11/24.
//

import UIKit

protocol CustomInputAccesoryViewDelegate: AnyObject {
    func inputView(_ inputView: CustomInputAccesoryView, uploadText text: String)
}

class CustomInputAccesoryView: UIView{
    //MARK: Properties
    weak var delegate: CustomInputAccesoryViewDelegate?
    
    private var commentTextView: InputTextView = {
        let tv = InputTextView()
        tv.placeholderText = " Enter a comment"
        tv.placeholderShouldCenter = false
        tv.font = UIFont.systemFont(ofSize: 14)
        tv.isScrollEnabled = false
        
        return tv
    }()
    
    private var postButton: UIButton = {
        let button = UIButton()
        button.setTitle("Post", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(onTapPost), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return .zero
    }
    
    //MARK: Config UI
    private func configureUI(){
        backgroundColor = .white
        autoresizingMask = .flexibleHeight
        
        addSubview(postButton)
        postButton.anchor(top: topAnchor, right: rightAnchor, paddingRight: 16)
        postButton.setDimensions(height: 40, width: 40)
        
        addSubview(commentTextView)
        commentTextView.anchor(top: topAnchor, left: leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: postButton.leftAnchor, paddingTop: 8, paddingLeft: 16, paddingRight: 8)
        
        let divider = UIView()
        divider.backgroundColor = .lightGray
        addSubview(divider)
        
        divider.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, height: 0.5)
    }
    
    //MARK: Actions
    @objc
    func onTapPost(){
        delegate?.inputView(self, uploadText: commentTextView.text)
    }
    
    func clearInputText(){
        commentTextView.text = nil
        commentTextView.placeholderLabel.isHidden = false
    }
    
}
