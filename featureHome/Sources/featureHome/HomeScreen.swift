import SwiftUI
import FeatureRepos

public struct HomeScreen: View {
    @StateObject private var viewModel: HomeViewModel
    private let homeDependencyProvider: HomeDependencyProvider
    
    public init(homeDependencyProvider: HomeDependencyProvider) {
        self.homeDependencyProvider = homeDependencyProvider
        _viewModel = StateObject(
            wrappedValue: homeDependencyProvider.getHomeViewModelFactory().create()
        )
    }

    public var body: some View {
        HomeScreenContent(
            state: viewModel.state,
            onAction: viewModel.onIntent(_:),
            reposViewModelFactory: homeDependencyProvider.getReposViewModelFactory()
        )
    }
}

private struct HomeScreenContent: View {
    let state: HomeViewState
    let onAction: (HomeIntent) -> Void
    
    let reposViewModelFactory: ReposViewModelFactory
    
    public var body: some View {
        TabView(
            selection: Binding(
                get: { state.activeTab },
                set: { onAction(.selectTab($0)) }
            ),
            
        ) {
            ReposScreen(viewModelFactory: reposViewModelFactory)
                .tabItem { Label("Repos", systemImage: "rectangle.stack") }
                .tag(HomeTab.repos)
            
            TabScreenContent("Users")
                .tabItem { Label("Users", systemImage: "person.3.fill") }
                .tag(HomeTab.users)
            
            TabScreenContent("Profile")
                .tabItem { Label("Profile", systemImage: "person.fill") }
                .tag(HomeTab.profile)
        }
    }
}

private struct TabScreenContent: View {
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(text)
        }
    }
}
