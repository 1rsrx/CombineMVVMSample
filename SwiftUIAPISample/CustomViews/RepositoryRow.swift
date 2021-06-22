//
//  RepositoryRow.swift
//  SwiftUIAPISample
//
//  Created by HikaruKuroda on 2021/06/23.
//

import SwiftUI

struct RepositoryRow: View {
    var repositoryName: String
    var repositoryURL: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(repositoryName)
                .font(.title2)
            
            Spacer()
                .frame(height: 5)
            
            Text(repositoryURL)
                .font(.subheadline)
                .foregroundColor(Color(.lightGray))
        }
    }
}

struct RepositoryRow_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryRow(repositoryName: "RepositoryName", repositoryURL: "RepositoryURL")
    }
}
