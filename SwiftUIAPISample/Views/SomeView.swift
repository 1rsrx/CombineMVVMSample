//
//  ContentView.swift
//  SwiftUIAPISample
//
//  Created by HikaruKuroda on 2021/06/22.
//

import SwiftUI
import Introspect

struct SomeView: View {
    @State var searchWord: String = ""
    
    var body: some View {
        SearchBar(text: $searchWord,
                  onSearchButtonClick: {
                    print("Did tap search button")
                  })
            .padding(.leading, 5)
            .padding(.trailing, 5)
            .introspectTextField { textField in
                textField.returnKeyType = .search
            }
    }
}

struct SomeView_Previews: PreviewProvider {
    static var previews: some View {
        SomeView()
    }
}
