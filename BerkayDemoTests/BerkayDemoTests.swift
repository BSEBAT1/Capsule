//
//  BerkayDemoTests.swift
//  BerkayDemoTests
//
//  Created by Berkay Sebat on 7/16/21.
//

import XCTest
@testable import BerkayDemo

// Move to FakeApiService.swift
class FakeApiService: ApiServiceProtocol {
    
    var fakedResults: [Article] = []
    
    func performSearch(withParams: [String : String], onSuccess success: @escaping ([Article]) -> Void, onFailure failure: @escaping (String) -> Void) {
        success(fakedResults)
    }
}

class BerkayDemoTests: XCTestCase {
    
    var feedViewModel: FeedViewModel!
    
    var fakeApiService: FakeApiService!
    
    override func setUp() {
        fakeApiService = FakeApiService()
        feedViewModel = FeedViewModel(searchAPI: fakeApiService)
    }
    
    func testCorrectNumberOfArticles() throws {
        fakeApiService.fakedResults = [
            Article(abstract: "abstract", leadParagraph: "leadParagraph", imageUrl: "imageUrl", headline: "headline", author: "author", articleUrl: "articleUrl")
        ]
        
        feedViewModel.performSearch()
        
        let retrievedArticle = feedViewModel.articleAt(at: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(fakeApiService.fakedResults[safe: 0]?.abstract, retrievedArticle.abstract)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
