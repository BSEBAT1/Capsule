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
        // Put setup code here. This method is called before the invocation of each test method in the class.
        fakeApiService = FakeApiService()
        feedViewModel = FeedViewModel(searchAPI: fakeApiService)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
