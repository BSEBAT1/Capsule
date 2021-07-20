//
//  ProjectTextField.swift
//  BerkayDemo
//
//  Created by Berkay Sebat on 7/19/21.
//

import Foundation
import UIKit

class PTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.placeholder = "Enter Search Text here example Yoga"
        self.font = UIFont.systemFont(ofSize: 15)
        self.borderStyle = UITextField.BorderStyle.roundedRect
        self.autocorrectionType = UITextAutocorrectionType.no
        self.keyboardType = UIKeyboardType.default
        self.returnKeyType = UIReturnKeyType.done
        self.clearButtonMode = UITextField.ViewMode.whileEditing
        self.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
