//
//  ProjectButton.swift
//  BerkayDemo
//
//  Created by Berkay Sebat on 7/18/21.
//

import Foundation
import UIKit

class PButton:UIButton {
    
    var articleLink = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitle("Go To Article", for: .normal)
        self.backgroundColor = UIColor.systemBlue
        self.setTitleColor(UIColor.white, for: .normal)
    }
    
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
}
