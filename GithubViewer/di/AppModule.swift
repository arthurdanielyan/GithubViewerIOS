//
//  AppModule.swift
//  GithubViewer
//
//  Created by Artur Danielyan on 14.09.26.
//

import DataAuth
import DomainAuth
import Network

final class AppModule {
    
    lazy var httpClient = SingletonDependencyProvider(
        factory: {
            let client = HttpClient()
            client.configure { config in
                config.baseUrl = "https://api.github.com"
            }
            return client
        }
    )
    
    lazy var authApi = SingletonDependencyProvider(AuthApi())
    lazy var tokenStore = SingletonDependencyProvider(TokenStore())
    
    var authRepository: any DependencyProvider<AuthRepository> {
        NewDependencyProvider { [unowned self] in
            AuthRepositoryImpl(
                api: authApi.get(),
                tokenStore: tokenStore.get(),
                httpClient: httpClient.get()
            )
        }
    }
}
