//
//  ContentView.swift
//  MVVMSwiftUICombine
//
//  Created by Pragati Rode on 05/09/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
        
        NavigationView {
            List {
               listSection
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}

private extension ContentView {
    var listSection: some View {
        Section {
            
        }
    }
}
