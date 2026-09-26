//
//  AuthRepositoryImpl.swift
//  data
//
//  Created by Artur Danielyan on 14.09.26.
//

import DomainAuth
import Network

public struct AuthRepositoryImpl: AuthRepository {
    private let api: AuthApi
    private let tokenStore: TokenStore
    private let httpClient: HttpClient
    
    public init(api: AuthApi, tokenStore: TokenStore, httpClient: HttpClient) {
        self.api = api
        self.tokenStore = tokenStore
        self.httpClient = httpClient
    }
    
    public func authenticate(apiToken: String) async throws {
        tokenStore.clearToken()
        try await api.authenticate(token: apiToken)
        httpClient.putToken("Bearer \(apiToken)")
        tokenStore.storeToken(apiToken)
    }
    
    public func isAuthenticated() async -> Bool {
        return tokenStore.getToken() != nil
    }
}
