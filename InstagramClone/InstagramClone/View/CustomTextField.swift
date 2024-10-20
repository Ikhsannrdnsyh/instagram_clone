//
//  CustomTextField.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 18/10/24.
//

import UIKit

class CustomTextField: UITextField{
    init(placeholder: String) {
        super.init(frame: .zero)
        
        let spacer = UIView()
        spacer.setDimensions(height: 36, width: 8)
        leftView = spacer
        leftViewMode = .always
        
        borderStyle = .roundedRect
        layer.borderColor = UIColor.systemGray.cgColor
        textColor = .black
        keyboardAppearance = .dark
        backgroundColor = UIColor(red: 237, green: 237, blue: 237, alpha: 1)
        setHeight(36)
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor.systemGray])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) has not been impleted")
    }
}

