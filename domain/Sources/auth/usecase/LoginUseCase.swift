//
//  File.swift
//  domain
//
//  Created by Artur Danielyan on 19.09.26.
//

import Foundation

public struct LoginUseCase : Sendable {
    private let authRepository: AuthRepository
    
    public init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    public func execute(token: String) async throws {
        try await authRepository.authenticate(apiToken: token)
    }
}
