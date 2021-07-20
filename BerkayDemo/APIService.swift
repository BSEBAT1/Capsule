//
//  APIService.swift
//  BerkayDemo
//
//  Created by Berkay Sebat on 7/17/21.
//

import Foundation

class ApiService {
    
  private var values = [Article]()
  private var searchQuery = "yoga"
  private var page = "0"
    
    func performSearch(withParams:[String:String], onSuccess success: @escaping (_ articleList:[Article]) -> Void, onFailure failure:@escaping (_ error:String) -> Void ) {
        if let query = withParams["q"] {
            searchQuery = query
        }
        if let pageCount = withParams["page_count"] {
            page = pageCount
        }
        let session = URLSession.shared
        let urlStringRep = "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=\(searchQuery)&page=\(page)&api-key=kuBAvE2e04A4pAGblHswUkr0x6ws53Wa"
        guard let url = URL(string:urlStringRep )  else {
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
                    for item in documentsList {
                        var article = Article()
                        if let abstract = item.abstract {
                            article.abstract = abstract
                        }
                        if let webUrl = item.webURL {
                            article.articleUrl = webUrl
                        }
                        if let lead = item.leadParagraph {
                            article.leadParagraph = lead
                        }
                        if let headline = item.headline?.main {
                            article.headline = headline
                        }
                        if let author = item.byline?.original {
                            article.author = author
                        }
                        if let multimedia = item.multimedia, multimedia.count > 0 {
                            if let url = multimedia[0].url {
                                article.imageUrl = "http://www.nytimes.com/"+url
                            }
                        }
                        self.values.append(article)
                    }
                    if self.page != "0" {
                        self.values.removeLast()
                    }
                    success(self.values)
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
