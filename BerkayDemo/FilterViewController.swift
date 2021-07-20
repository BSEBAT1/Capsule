//
//  FilterViewController.swift
//  BerkayDemo
//
//  Created by Berkay Sebat on 7/16/21.
//

import Foundation
import UIKit

class FilterViewController: GradientViewController {

    private let applyButton: PButton = {
        let button = PButton()
        button.setTitle("Apply", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(applyButtonPressed), for: .touchUpInside)
        return button
    }()

    private let filterView:PTextField = {
        let textField = PTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let viewModel: FilterViewModel
    
    init(viewModel: FilterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        title = "Filter"
        view.addSubview(applyButton)
        view.addSubview(filterView)
        filterView.delegate = self
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            filterView.topAnchor.constraint(equalTo: view.topAnchor,constant: 100),
            filterView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: +10),
            filterView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            filterView.heightAnchor.constraint(equalToConstant: 50),
            applyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            applyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            applyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            applyButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    @objc func applyButtonPressed() {
        if let query = filterView.text {
            viewModel.performSearchFilter(["q":query])
        }
        self.navigationController?.popViewController(animated: true)
    }
}

extension FilterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
           return true
       }
}



