//
//  Collection+Extensions.swift
//  BerkayDemo
//
//  Created by Berkay Sebat on 7/19/21.
//

import Foundation

extension Collection {
    
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
