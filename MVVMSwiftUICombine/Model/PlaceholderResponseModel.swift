//
//  PlaceholderResponseModel.swift
//  MVVMSwiftUICombine
//
//  Created by Pragati Rode on 05/09/23.
//

import Foundation

// MARK: - PlaceholderResponseModelElement
struct PlaceholderResponseModelElement: Codable, Identifiable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias PlaceholderResponseModel = [PlaceholderResponseModelElement]
