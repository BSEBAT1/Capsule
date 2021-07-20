//
//  GradientView.swift
//  BerkayDemo
//
//  Created by Berkay Sebat on 7/18/21.
//

import Foundation
import UIKit

class GradientViewController: UIViewController {
    func setGradientBackground() {
        let colorBottom =  UIColor(red: 1.00, green: 0.16, blue: 0.32, alpha: 1.00).cgColor
        let colorTop = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.00).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
    }
}
