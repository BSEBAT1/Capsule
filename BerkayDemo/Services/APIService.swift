//
//  APIService.swift
//  BerkayDemo
//
//  Created by Berkay Sebat on 7/17/21.
//

import Foundation

protocol ApiServiceProtocol {
    func performSearch(
        withParams:[String: String],
        onSuccess success: @escaping (_ articleList: [Article]) -> Void,
        onFailure failure:@escaping (_ error: String) -> Void
    )
}

class ApiService: ApiServiceProtocol {
    
  private var searchQuery = "yoga"
  private var page = "0"
    
    func performSearch(withParams:[String: String], onSuccess success: @escaping (_ articleList: [Article]) -> Void, onFailure failure:@escaping (_ error: String) -> Void ) {
        if let query = withParams["q"] {
            searchQuery = query
        }
        if let pageCount = withParams["page_count"] {
            page = pageCount
        }
        let session = URLSession.shared
        let urlStringRep = "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=\(searchQuery)&page=\(page)&api-key=kuBAvE2e04A4pAGblHswUkr0x6ws53Wa"
        guard let url = URL(string: urlStringRep ) else {
            failure("URL Error")
            return
        }
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil || data == nil {
                failure("Client error!")
                return
            }
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                failure("Server error!")
                return
            }
            guard let mime = response.mimeType, mime == "application/json" else {
                failure("Wrong MIME type!")
                return
            }
            do {
                let articlesList = try JSONDecoder().decode(News.self, from: data!)
                if let documentsList = articlesList.response?.docs {
                    let articles = documentsList
                        .map { (doc: Doc) -> Article in
                            var imageURL:String? = nil
                            if let url = doc.multimedia, url.count > 0, let imgString = url[0].url {
                                imageURL = "http://www.nytimes.com/"+imgString
                            }
                            return Article(
                                abstract: doc.abstract,
                                leadParagraph: doc.leadParagraph,
                                imageUrl: imageURL,
                                headline: doc.headline?.main,
                                author: doc.byline?.original,
                                articleUrl: doc.webURL)
                        }
                    success(articles)
                } else {
                    failure("No Values Returned")
                }
            } catch {
                failure(String(describing: error))
            }
        }
        task.resume()
    }
}
