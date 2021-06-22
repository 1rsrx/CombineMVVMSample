//
//  GitHubAPI.swift
//  SwiftUIAPISample
//
//  Created by HikaruKuroda on 2021/06/18.
//

import Foundation
import Combine

struct GitHubSearchResult: Codable {
    var items: [Repository]
}

struct Repository: Codable, Identifiable {
    var id: Int
    var name: String
    var full_name: String
    var html_url: String
}

class GitHubAPI {
    
    func searchRepositories(with searchWord: String) -> AnyPublisher<[Repository], Error> {
        let url = URL(string: "https://api.github.com/search/repositories?q=\(searchWord)&sort=stars")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { try JSONDecoder().decode(GitHubSearchResult.self, from: $0.data).items }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
