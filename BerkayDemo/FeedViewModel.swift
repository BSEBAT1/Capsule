//
//  FeedViewDataModel.swift
//  BerkayDemo
//
//  Created by Berkay Sebat on 7/16/21.
//

import Foundation

class FeedViewModel {
    
   private var articles = [Article]()
   var didUpdate: ((String?) -> ()) = {_ in }
   private var pageCount = 0
   private let api:ApiServiceProtocol
   private(set) var filterViewModel: FilterViewModel!
    
    init(searchAPI:ApiServiceProtocol) {
        api = searchAPI
        filterViewModel = FilterViewModel(api: searchAPI, onFilterApplied: { [weak self] articles in
            self?.articles = articles
            self?.didUpdate(nil)
        }, onFailed:{ [weak self] errorDesc in
            self?.didUpdate(errorDesc)
        })
    }
    
   func performSearch() {
        let paramaters = ["page_count":String(pageCount)]
        api.performSearch(withParams:paramaters, onSuccess:{ article in
            self.articles += article
            self.didUpdate(nil)
            self.pageCount = self.pageCount+1
        }, onFailure: { error in
            self.didUpdate(error)
        })
    }
    
    func articleAt(at indexPath: IndexPath) -> Article {
        return articles[indexPath.row]
    }
    
    func articleCount() -> Int {
        return articles.count
    }
    
}

