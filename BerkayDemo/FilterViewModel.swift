//
//  FilterViewModel.swift
//  BerkayDemo
//
//  Created by Berkay Sebat on 7/19/21.
//

import Foundation

class FilterViewModel {
    
   private let searchApi:ApiServiceProtocol
   private let onFilterApplied: ([Article]) -> ()
   
    init(api:ApiServiceProtocol, onFilterApplied: @escaping ([Article]) -> (), onFailed: @escaping (String) -> ()) {
        searchApi = api
        self.onFilterApplied = onFilterApplied
    }
    
    func performSearchFilter(_ params:[String:String]) {
        searchApi.performSearch(withParams: params) { articles in
            print("success: \(articles)")
            self.onFilterApplied(articles)
        } onFailure: { error in
            print("error: \(error)")
        }
    }
}


