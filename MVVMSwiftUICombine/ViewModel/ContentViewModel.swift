//
//  ContentViewModel.swift
//  MVVMSwiftUICombine
//
//  Created by Pragati Rode on 05/09/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var arrayItems: PlaceholderResponseModel = []
    
    init() {
        getData()
    }
    func getData() {
        let item = PlaceholderResponseModelElement(userID: 1, id: 1, title: "test", body: "Description")
        arrayItems.append(item)
    }
}
