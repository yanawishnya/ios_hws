//
//  ApiService.swift
//  lesson2
//
//  Created by Барбашина Яна on 23.10.2022.
//

import UIKit

final class ApiService {
    static let shared = ApiService()
    
    struct Constants {
        static let topStoriesUrl = URL(string: "https://newsapi.org/v2/top-headlines?" +
                                      "country=us&" +
                                      "apiKey=27cf3cd2bf704dc6830842d55a840b5f")
    }
    
    private init() {}
    
    func getTopStories(completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url = Constants.topStoriesUrl else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error  in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(ApiResponse.self, from: data)
                    print("Articles: \(result.articles.count)")
                    
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}

struct ApiResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
}
