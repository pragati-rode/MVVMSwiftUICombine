//
//  ContentViewModel.swift
//  MVVMSwiftUICombine
//
//  Created by Pragati Rode on 05/09/23.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    @Published var arrayItems: PlaceholderResponseModel = []
    var cancellable = Set<AnyCancellable>()
    let service: ContentService
    
    init(service: ContentService) {
        self.service = service
       // getData()
        getServerData()
    }
    func getData() {
        let item = PlaceholderResponseModelElement(userID: 1, id: 1, title: "test", body: "Description")
        arrayItems.append(item)
    }
    
    func getServerData() {
        service.getPlaceholderData()
            .sink { completion in
                switch completion {
                case .failure(let error) :
                    print(error)
                case .finished:
                    print("Completion")
                }
            } receiveValue: { [weak self] response in
                self?.arrayItems = response
            }.store(in: &self.cancellable)

    }
}
