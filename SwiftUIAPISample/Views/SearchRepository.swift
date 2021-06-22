//
//  SearchRepository.swift
//  SwiftUIAPISample
//
//  Created by HikaruKuroda on 2021/06/18.
//

import SwiftUI
import Combine
import Introspect

struct SearchRepository: View {
    @ObservedObject var viewModel: SearchRepositoryViewModel
    
    init(viewModel: SearchRepositoryViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            SearchBar(text: $viewModel.searchWord,
                      onSearchButtonClick: {
                        viewModel.onSearchButtonClick()
                      })
                .padding(.leading, 5)
                .padding(.trailing, 5)
                .onAppear(perform: {
                    UITextField.appearance().returnKeyType = .search
                })
                .introspectTextField { textField in
                    textField.returnKeyType = .search
                }
            
            List(viewModel.repositories) { repo in
                RepositoryRow(repositoryName: repo.full_name, repositoryURL: repo.html_url)
            }

        }
        .padding(.top, 5)
        
    }
}

struct SearchRepository_Previews: PreviewProvider {
    static var previews: some View {
        SearchRepository(viewModel: SearchRepositoryViewModel())
    }
}
