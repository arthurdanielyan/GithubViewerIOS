//
//  LoginViewModelFactoryImpl.swift
//  GithubViewer
//
//  Created by Artur Danielyan on 20.09.26.
//

import FeatureLogin
import DomainAuth
import Navigation

struct LoginViewModelFactoryImpl: LoginViewModelFactory {
    private let loginUseCase: LoginUseCase
    private let appRouter: AppRouter
    
    init(
        loginUseCase: LoginUseCase,
        appRouter: AppRouter
    ) {
        self.loginUseCase = loginUseCase
        self.appRouter = appRouter
    }
    
    func create() -> LoginViewModel {
        LoginViewModel(
            loginUseCase: loginUseCase,
            appRouter: appRouter,
        )
    }
}
