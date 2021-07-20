//
//  FilterViewModel.swift
//  BerkayDemo
//
//  Created by Berkay Sebat on 7/19/21.
//

import Foundation

class FilterViewModel {
    
   private let searchApi:ApiService
   
    init(api:ApiService) {
        searchApi = api
    }
    
    func performSearchFilter(_ params:[String:String]) {
        searchApi.performSearch(withParams: params) { <#[Article]#> in
            <#code#>
        } onFailure: { <#String#> in
            <#code#>
        }

    }
    
}


