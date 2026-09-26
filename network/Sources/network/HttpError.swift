//
//  HttpError.swift
//  network
//
//  Created by Artur Danielyan on 21.09.26.
//

import Foundation

enum HttpError: Error {
    case badUrl(String)
    case badResponse(URLResponse)
    case serializationError(cause: Error)
    case networkError
}
