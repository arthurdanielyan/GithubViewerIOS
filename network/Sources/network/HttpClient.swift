//
//  HttpClient.swift
//  GithubViewer
//
//  Created by Artur Danielyan on 14.09.26.
//

public class HttpClient {
    
    public init() {}
    
    private var configuration = HttpClientConfiguration()
    
    public init(block: (inout HttpClientConfiguration) -> Void) {
        block(&configuration)
    }
    
    public func configure(block: (inout HttpClientConfiguration) -> Void) {
        block(&configuration)
    }
}

public struct HttpClientConfiguration {
    
    public var headers: [String: String] = [:]
    public var baseUrl: String? = nil
    
    public init() {}
    
    public init(headers: [String : String] = [:], baseUrl: String? = nil) {
        self.headers = headers
        self.baseUrl = baseUrl
    }
    
    public mutating func addHeaders(_ headers: [String: String]) {
        self.headers.merge(headers) { (_, new) in new }
    }
}
