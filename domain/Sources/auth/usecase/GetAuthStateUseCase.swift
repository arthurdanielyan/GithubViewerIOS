//
//  File.swift
//  domain
//
//  Created by Artur Danielyan on 19.09.26.
//

import Foundation

public struct GetAuthStateUseCase: Sendable {
    private let authRepository: AuthRepository
    
    public init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    public func execute() async -> Bool {
        try await authRepository.isAuthenticated()
    }
}
