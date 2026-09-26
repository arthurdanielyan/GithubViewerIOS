import SwiftUI
import FeatureRepos

public struct MainScreen: View {
    @StateObject private var viewModel: MainViewModel
    @State private var mainDependencyProvider: MainDependencyProvider
    
    public init(mainDependencyProvider: MainDependencyProvider) {
        self.mainDependencyProvider = mainDependencyProvider
        _viewModel = StateObject(
            wrappedValue: mainDependencyProvider.getMainViewModelFactory().create()
        )
    }

    public var body: some View {
        MainScreenContent(
            state: viewModel.state,
            onAction: viewModel.onIntent(_:),
            reposViewModelFactory: mainDependencyProvider.getReposViewModelFactory()
        )
    }
}

private struct MainScreenContent: View {
    let state: MainViewState
    let onAction: (MainIntent) -> Void
    
    @State var reposViewModelFactory: ReposViewModelFactory
    
    public var body: some View {
        TabView(
            selection: Binding(
                get: { state.activeTab },
                set: { onAction(.selectTab($0)) }
            ),
            
        ) {
            ReposScreen(viewModelFactory: reposViewModelFactory)
                .tabItem {
                    Label("Repos", systemImage: "rectangle.stack")
                }
            
            TabScreenContent("Users")
                .tabItem {
                    Label("Users", systemImage: "person.3.fill")
                }
            
            TabScreenContent("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
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
