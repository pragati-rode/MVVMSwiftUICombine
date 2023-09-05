//
//  ContentService.swift
//  MVVMSwiftUICombine
//
//  Created by Pragati Rode on 05/09/23.
//

import Foundation
import Combine


class ContentService {
    var cancellable = Set<AnyCancellable>()
    func getPlaceholderData() -> Future<PlaceholderResponseModel, PlaceholderError> {
        return Future { promise in
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return promise(.failure(.parsingError(description: "Invalid URL")))}
            URLSession.shared.dataTaskPublisher(for: url)
                .receive(on: DispatchQueue.main)
                .tryMap {(data, response) in
                    guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                        throw PlaceholderError.networkError(description: "Invalid Response")
                    }
                    return data
                }
                .decode(type: PlaceholderResponseModel.self, decoder: JSONDecoder())
                .sink { completion in
                    if case let .failure(error) = completion {
                        switch error {
                        case _ as DecodingError :
                            promise(.failure(.parsingError(description: "failed to parse data")))
                        default:
                            promise(.failure(.networkError(description: "not able to get data")))
                        }
                    }
                } receiveValue: { response in
                    return promise(.success(response))
                }
                .store(in: &self.cancellable)

        }
    }
}
