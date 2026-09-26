//
//  AuthApi.swift
//  data
//
//  Created by Artur Danielyan on 14.09.26.
//

import Network

public struct AuthApi: Sendable {
    private let httpClient: HttpClient
    
    public init(httpClient: HttpClient) {
        self.httpClient = httpClient
    }

    public func authenticate(token: String) async throws {
        try await httpClient.get(
            endpoint: "user",
            headers: ["Authorization": "Bearer \(token)"]
        ) as EmptyResponse
    }
}
