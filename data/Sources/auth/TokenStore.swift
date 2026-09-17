//
//  TokenStore.swift
//  data
//
//  Created by Artur Danielyan on 14.09.26.
//

import Foundation

public struct TokenStore {
    
    public init() {}
    
    private let TOKEN_KEY = "token"
    
    func storeToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: TOKEN_KEY)
    }
    
    func getToken() -> String? {
        return UserDefaults.standard.string(forKey: TOKEN_KEY)
    }
    
    func clearToken() {
        UserDefaults.standard.removeObject(forKey: TOKEN_KEY)
    }
}
