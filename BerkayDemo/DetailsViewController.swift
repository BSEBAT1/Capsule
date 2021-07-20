//
//  DetailsViewController.swift
//  BerkayDemo
//
//  Created by Berkay Sebat on 7/18/21.
//

import Foundation
import UIKit

class DetailsViewController: GradientViewController {
    
   private let detailIcon = UIImageView()
   private let headlineLabel = PLabel()
   private let bodyText = PLabel()
   private let author = PLabel()
   private let vStack = UIStackView()
   private let hstack = UIStackView()
   private let button = PButton()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            configureViews()
    }
    
    init(articleData:Article) {
        super.init(nibName: nil, bundle: nil)
        headlineLabel.text = articleData.headline
        bodyText.text = articleData.abstract
        author.text = articleData.author
        detailIcon.download(from: articleData.imageUrl, contentMode: .scaleAspectFit)
        button.articleLink = articleData.articleUrl
        button.addTarget(self, action: #selector(openArticle), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   private func configureViews() {
        detailIcon.translatesAutoresizingMaskIntoConstraints = false
        headlineLabel.translatesAutoresizingMaskIntoConstraints = false
        hstack.translatesAutoresizingMaskIntoConstraints = false
        author.translatesAutoresizingMaskIntoConstraints = false
        bodyText.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        hstack.axis = .horizontal
        hstack.alignment = .center
        hstack.distribution = .fillEqually
        hstack.spacing = 8
        hstack.addArrangedSubview(detailIcon)
        hstack.addArrangedSubview(headlineLabel)
        view.addSubview(hstack)
        view.addSubview(author)
        view.addSubview(bodyText)
        view.addSubview(button)
        hstack.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hstack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: +10).isActive = true
        hstack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        view.backgroundColor = UIColor.white
        detailIcon.clipsToBounds = true
        detailIcon.heightAnchor.constraint(equalToConstant: 250).isActive = true
        author.topAnchor.constraint(equalTo: hstack.bottomAnchor, constant: 1).isActive = true
        author.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -5).isActive = true
        bodyText.topAnchor.constraint(equalTo: author.bottomAnchor, constant: 10).isActive = true
        bodyText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: +1).isActive = true
        bodyText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: +10).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.topAnchor.constraint(equalTo: bodyText.bottomAnchor,constant: 25).isActive = true
    }
    
    @objc func openArticle() {
        guard let url = URL(string: button.articleLink) else { return }
        UIApplication.shared.open(url)
    }
    
}
