//
//  SwiftUIAPISampleApp.swift
//  SwiftUIAPISample
//
//  Created by HikaruKuroda on 2021/06/18.
//

import SwiftUI

@main
struct SwiftUIAPISampleApp: App {
    var body: some Scene {
        WindowGroup {
            SearchRepository(viewModel: SearchRepositoryViewModel())
        }
    }
}
