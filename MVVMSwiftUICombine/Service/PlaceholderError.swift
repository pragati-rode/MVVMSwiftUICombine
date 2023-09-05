//
//  PlaceholderError.swift
//  MVVMSwiftUICombine
//
//  Created by Pragati Rode on 05/09/23.
//

import Foundation

enum PlaceholderError: Error {
case networkError(description: String)
case parsingError(description: String)
}
