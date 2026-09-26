//
//  MainDependecyProvider.swift
//  GithubViewer
//
//  Created by Artur Danielyan on 27.09.26.
//

import Foundation
import FeatureMain
import FeatureRepos
import Navigation

final class MainDependencyProviderImpl: MainDependencyProvider {
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
    
    lazy var mainViewModelFactory: any DependencyProvider<MainViewModelFactory> =
    NewDependencyProvider { [unowned self] in
        MainViewModelFactoryImpl(
            appRouter: appRouter.get()
        )
    }
    
    func getMainViewModelFactory() -> MainViewModelFactory {
        return mainViewModelFactory.get()
    }
    
    func getReposViewModelFactory() -> ReposViewModelFactory {
        return reposViewModelFactory.get()
    }
}
