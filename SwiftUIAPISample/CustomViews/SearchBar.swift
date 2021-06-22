//
//  SearchBar.swift
//  SwiftUIAPISample
//
//  Created by HikaruKuroda on 2021/06/19.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @State private var isEditing = false

    var onSearchButtonClick: () -> Void
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color(.lightGray))
                    .padding(.leading, 5)
                
                TextField("Search", text: $text,
                          onCommit: {
                            self.onSearchButtonClick()
                          }
                )
                .padding(.top, 5)
                .padding(.bottom, 5)
                .padding(.leading, -5)
                .onTapGesture {
                    self.isEditing = true
                }
                
                if isEditing {
                    Button(action: {
                        self.text = ""
                    }, label: {
                        Image(systemName: "multiply.circle.fill")
                            .foregroundColor(.gray)
                            .offset(x: -5)
                    })
                }
                
            }
        }
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
    
    public func onSearchButtonClick(action: () -> Void) -> some View {
        action()
        return self
    }
}
