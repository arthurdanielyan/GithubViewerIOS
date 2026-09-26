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
    private let appRouterObj = AppRouterImpl()
    @StateObject private var appRouter = AppRouterImpl()
    
    init(appModule: AppModule) {
        self.appModule = appModule
    }
    
    var body: some View {
        NavigationStack(path: $appRouter.stack) {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
            .navigationTitle("Login")
            .navigationDestination(for: LoginDestination.self) { _ in
                LoginScreen(viewModelFactory: appModule.loginViewModelFactory.get())
                    .navigationBarBackButtonHidden(true)
            }
            .navigationDestination(for: HomeDestination.self) { _ in
                HomeScreen(homeDependencyProvider: appModule.homeDependencyProvider.get())
                    .navigationBarBackButtonHidden(true)
            }
        }
        .onAppear {
            appModule.putAppRouter(appRouter: appRouter)
            appRouter.stack.removeLast(appRouter.stack.count)
            appRouter.stack.append(LoginDestination())
        }
    }
}

#Preview {
    ContentView(appModule: AppModule())
}
