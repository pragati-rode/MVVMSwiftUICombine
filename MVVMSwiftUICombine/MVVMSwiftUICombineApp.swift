//
//  MVVMSwiftUICombineApp.swift
//  MVVMSwiftUICombine
//
//  Created by Pragati Rode on 05/09/23.
//

import SwiftUI

@main
struct MVVMSwiftUICombineApp: App {
    var body: some Scene {
        WindowGroup {
            let service = ContentService()
            let viewModel = ContentViewModel(service: service)
           
            ContentView(viewModel: viewModel)
        }
    }
}
