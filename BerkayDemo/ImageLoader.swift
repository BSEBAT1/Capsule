//
//  ImageLoader.swift
//  BerkayDemo
//
//  Created by Berkay Sebat on 7/18/21.
//

import Foundation
import UIKit

extension UIImageView {
    func download(from url: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL.init(string: url) else {return}
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
}
