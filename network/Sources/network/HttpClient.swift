//
//  HttpClient.swift
//  GithubViewer
//
//  Created by Artur Danielyan on 14.09.26.
//

import Foundation

public final class HttpClient: @unchecked Sendable {
    
    public init() {}
    
    private let lock = NSLock()
    private var configuration = HttpClientConfiguration()
    
    public init(block: (inout HttpClientConfiguration) -> Void) {
        lock.withLock {
            block(&configuration)
        }
    }
    
    public func configure(block: (inout HttpClientConfiguration) -> Void) {
        lock.withLock {
            block(&configuration)
        }
    }
    
    public func putToken(_ token: String) {
        
    }
    
    public func get<Response: Codable>(
        endpoint: String,
        params: [String: String]? = nil,
        headers: [String: String]? = nil
    ) async throws -> Response {
        
        var urlString = "\(configuration.baseUrl+endpoint)"
        if let params {
            urlString.append("?")
            urlString.append(
                params.map { key, value in
                    "\(key)=\(value)"
                }.joined(separator: "&")
            )
        }
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badUrl(urlString)
        }
        
        var request = URLRequest(url: url)
        print("Request: GET \(request)")
        print("params: \(params)")
        let headers = configuration.headers
            .merging(headers ?? [:], uniquingKeysWith: { $1 })
        print("headers: \(headers)")
        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"
        
        let data: Data
        let response: URLResponse
        do {
            (data, response) = try await URLSession.shared.data(for: request)
        } catch let error as URLError where error.code == .notConnectedToInternet {
            throw HttpError.networkError
        }
        
        print("Response: \((response as? HTTPURLResponse)?.statusCode)")
        print(response)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw HttpError.badResponse(response)
        }
        
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(Response.self, from: data)
        } catch {
            throw HttpError.serializationError(cause: error)
        }
        
    }
}

public struct HttpClientConfiguration: Sendable {
    
    public var headers: [String: String] = [:]
    public var baseUrl: String = ""
    public var token: String? = nil
    public var tokenHeader: String? = nil
    
    public init() {}
    
    public init(headers: [String : String] = [:], baseUrl: String) {
        self.headers = headers
        self.baseUrl = baseUrl
    }
    
    public mutating func addHeaders(_ headers: [String: String]) {
        self.headers.merge(headers) { (_, new) in new }
    }
}
