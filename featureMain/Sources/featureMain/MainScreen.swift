import SwiftUI

public struct MainScreen: View {
    @StateObject private var viewModel: MainViewModel
    
    public init(mainViewModelFactory: MainViewModelFactory) {
        _viewModel = StateObject(wrappedValue: mainViewModelFactory.create())
    }

    public var body: some View {
        MainScreenContent(
            state: viewModel.state,
            onAction: viewModel.onIntent(_:)
        )
    }
}

private struct MainScreenContent: View {
    let state: MainViewState
    let onAction: (MainIntent) -> Void
    
    public var body: some View {
        TabView(
            selection: Binding(
                get: { state.activeTab },
                set: { onAction(.selectTab($0)) }
            ),
            
        ) {
            TabScreenContent("Repos")
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

#Preview {
    MainScreenContent(
        state: MainViewState(),
        onAction: { _ in }
    )
}
