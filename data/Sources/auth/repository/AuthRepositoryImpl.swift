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
        httpClient.configure { config in
            config.addHeaders([:])
        }
        tokenStore.storeToken(apiToken)
    }
}
