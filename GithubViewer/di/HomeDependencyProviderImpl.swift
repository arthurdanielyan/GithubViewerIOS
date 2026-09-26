//
//  HomeDependencyProvider.swift
//  GithubViewer
//
//  Created by Artur Danielyan on 27.09.26.
//

import Foundation
import FeatureHome
import FeatureRepos
import Navigation

final class HomeDependencyProviderImpl: HomeDependencyProvider {
    private var appRouter: any DependencyProvider<AppRouter>
    
    init(appRouter: any DependencyProvider<AppRouter>) {
        self.appRouter = appRouter
    }
    
    lazy var reposViewModelFactory: any DependencyProvider<ReposViewModelFactory> =
    NewDependencyProvider { [unowned self] in
        ReposViewModelFactoryImpl(
            appRouter: appRouter.get()
        )
    }
    
    lazy var homeViewModelFactory: any DependencyProvider<HomeViewModelFactory> =
    NewDependencyProvider { [unowned self] in
        HomeViewModelFactoryImpl(
            appRouter: appRouter.get()
        )
    }
    
    func getHomeViewModelFactory() -> HomeViewModelFactory {
        return homeViewModelFactory.get()
    }
    
    func getReposViewModelFactory() -> ReposViewModelFactory {
        return reposViewModelFactory.get()
    }
}
