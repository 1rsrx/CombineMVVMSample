//
//  SearchRepositoryViewModel.swift
//  SwiftUIAPISample
//
//  Created by HikaruKuroda on 2021/06/18.
//

import Foundation
import Combine

class SearchRepositoryViewModel: ObservableObject, Identifiable {
    
    //MARK: Input
    @Published var searchWord = ""
    
    //MARK: Output
    @Published var repositories = [Repository]()
    
    //MARK: Property
    var cancelables = Set<AnyCancellable>()
    
    init() {
        
    }
    
    func onSearchButtonClick() {
        GitHubAPI().searchRepositories(with: searchWord)
            .sink { completion in
                switch completion {
                case .finished:
                    print("終了")
                case .failure(_):
                    print("エラー")
                }
            } receiveValue: { repos in
                self.repositories = repos
            }
            .store(in: &cancelables)
    }
}


