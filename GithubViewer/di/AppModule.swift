//
//  AppModule.swift
//  GithubViewer
//
//  Created by Artur Danielyan on 14.09.26.
//

import DataAuth
import DomainAuth
import Network
import Navigation
import FeatureLogin
import FeatureMain

final class AppModule {
    
    lazy var httpClient = SingletonDependencyProvider(
        factory: {
            let client = HttpClient()
            client.configure { config in
                config.baseUrl = "https://api.github.com/"
                config.tokenHeader = "Authorization"
            }
            return client
        }
    )
    
    lazy var authApi = SingletonDependencyProvider(
        AuthApi(
            httpClient: httpClient.get()
        )
    )
    lazy var tokenStore = SingletonDependencyProvider(TokenStore())
    
    var authRepository: any DependencyProvider<AuthRepository> {
        NewDependencyProvider { [unowned self] in
            AuthRepositoryImpl(
                api: authApi.get(),
                tokenStore: tokenStore.get(),
                httpClient: httpClient.get(),
            )
        }
    }
    
    lazy var loginUseCase =
    NewDependencyProvider { [unowned self] in
        LoginUseCase(
            authRepository: authRepository.get(),
        )
    }
    lazy var loginViewModelFactory: any DependencyProvider<LoginViewModelFactory> =
    NewDependencyProvider { [unowned self] in
        LoginViewModelFactoryImpl(
            loginUseCase: loginUseCase.get(),
            appRouter: appRouter!
        )
    }
    
    lazy var mainViewModelFactory: any DependencyProvider<MainViewModelFactory> =
    NewDependencyProvider { [unowned self] in
        MainViewModelFactoryImpl(
            appRouter: appRouter!
        )
    }
    
    lazy var mainDependecyProvider: any DependencyProvider<MainDependencyProvider> =
    NewDependencyProvider { [unowned self] in
        MainDependencyProviderImpl(
            appRouter: SingletonDependencyProvider(appRouter!)
        )
    }
    
    private var appRouter: AppRouter? = nil
    
    func putAppRouter(appRouter: AppRouter) {
        self.appRouter = appRouter
    }
}
