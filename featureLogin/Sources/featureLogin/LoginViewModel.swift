//
//  File.swift
//  featureLogin
//
//  Created by Artur Danielyan on 19.09.26.
//

import Foundation
import DomainAuth
//import Combine
import Navigation

@MainActor
public final class LoginViewModel: ObservableObject {
    private let loginUseCase: LoginUseCase
    private let appRouter: AppRouter
    
    @Published private(set) var state: LoginViewState = LoginViewState()
    
    public init(
        loginUseCase: LoginUseCase,
        appRouter: AppRouter,
    ) {
        self.loginUseCase = loginUseCase
        self.appRouter = appRouter
    }
    
    func onIntent(_ intent: LoginIntent) {
        switch intent {
        case .loginClick: login()
        case .tokenInputChange(let input): onTokenInputChange(input)
        }
    }
    
    private func onTokenInputChange(_ input: String) {
        state.tokenInput = input
    }
    
    private func login() {
        state.isLoading = true
        Task {
            do {
                print(state.tokenInput)
                try await loginUseCase.execute(token: state.tokenInput)
                appRouter.navigate(HomeDestination())
                print("Success")
            } catch {
                print(error)
            }
            state.isLoading = false
        }
    }
}
