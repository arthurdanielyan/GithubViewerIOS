//
//  AuthRepository.swift
//  GithubViewer
//
//  Created by Artur Danielyan on 13.09.26.
//

public protocol AuthRepository {
    
    func authenticate(apiToken: String) async throws -> Void
}
