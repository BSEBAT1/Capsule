//
//  FeedViewController.swift
//  BerkayDemo
//
//  Created by Berkay Sebat on 7/16/21.
//

import Foundation
import UIKit

class FeedViewController:UITableViewController {
    
   private let searchApi = ApiService.init()
   private let feedData:FeedViewModel
    
    init() {
        feedData = FeedViewModel.init(searchAPI: searchApi)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedData.didUpdate = { [weak self] error in
            if let errorMessage = error {
                self?.displayError(errorMessage)
            } else {
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
        configureViews()
        feedData.performSearch()
    }
    
    
    
  private func configureViews() {
        let titleLabel = PLabel()
        titleLabel.text = "Healthy Articles"
        titleLabel.textColor = UIColor.white
        let hStack = UIStackView(arrangedSubviews: [titleLabel])
        hStack.spacing = 5
        hStack.alignment = .center
        navigationItem.titleView = hStack
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filter))
        self.tableView.register(ListingCell.self, forCellReuseIdentifier: String(describing: ListingCell.self))
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    @objc func filter() {
        let filterViewController = FilterViewController(viewModel: feedData.filterViewModel)
        self.navigationController?.pushViewController(filterViewController, animated: true)
    }
    
   private func displayError(_ message:String) {
        let alert = UIAlertController(title: "Error", message:message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    }
    
    }

extension FeedViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListingCell.self)) as! ListingCell
        cell.configure(data:feedData.articleAt(at: indexPath))
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        feedData.articleCount()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == feedData.articleCount() - 1 {
            feedData.performSearch()
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.present(DetailsViewController(articleData:feedData.articleAt(at: indexPath) ), animated: true, completion: nil)
    }
}
