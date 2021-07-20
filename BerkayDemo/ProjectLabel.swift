//
//  ProjectLabel.swift
//  BerkayDemo
//
//  Created by Berkay Sebat on 7/18/21.
//

import Foundation
import UIKit

class PLabel: UILabel {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
    }

    override func drawText(in rect: CGRect) {
        self.textColor = UIColor.black
        super.drawText(in: rect)
    }
    
}
