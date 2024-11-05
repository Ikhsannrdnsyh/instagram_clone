//
//  InputTextView.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 05/11/24.
//

import UIKit

class InputTextView: UITextView {
    //MARK: Properties
    var placeholderText: String? {
        didSet { placeholderLabel.text = placeholderText }
    }
    
    let placeholderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        
        return label
    }()
    
    //MARK: Life cycle
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configure UI
    private func configureUI(){
        addSubview(placeholderLabel)
        placeholderLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
//        placeholderLabel.centerY(inView: self)
        
        NotificationCenter.default.addObserver(self, selector: #selector(onTextChanged), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    //MARK: Action
    @objc
    func onTextChanged(){
        placeholderLabel.isHidden = !text.isEmpty
    }
}
