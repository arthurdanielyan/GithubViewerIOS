//
//  ContentView.swift
//  GithubViewer
//
//  Created by Artur Danielyan on 17.09.26.
//

import SwiftUI
import Navigation
import FeatureLogin
import FeatureHome

struct ContentView: View {
    private let appModule: AppModule
    @StateObject private var appRouter: AppRouterImpl
    @StateObject private var mainViewModel: MainViewModel
    
    init(appModule: AppModule) {
        self.appModule = appModule
        _appRouter = StateObject(wrappedValue: appModule.appRouter)
        _mainViewModel = StateObject(wrappedValue: appModule.mainViewModelFactory.get().create())
    }
    
    var body: some View {
        NavigationStack(path: $appRouter.stack) {
            Group {
                switch appRouter.root {
                case .splash:
                        ProgressView()
                case .login:
                    LoginScreen(viewModelFactory: appModule.loginViewModelFactory.get())
                        .navigationBarBackButtonHidden(true)
                case .home:
                    HomeScreen(homeDependencyProvider: appModule.homeDependencyProvider.get())
                        .navigationBarBackButtonHidden(true)
                }
            }
            .transition(.opacity)
        }
        .animation(.default, value: appRouter.root)
        .onAppear {
            mainViewModel.loadAuthState()
        }
    }
}

#Preview {
    ContentView(appModule: AppModule())
}
