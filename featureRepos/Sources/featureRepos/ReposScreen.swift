import SwiftUI

public struct ReposScreen: View {
    @StateObject private var viewModel: ReposViewModel
    
    public init(viewModelFactory: ReposViewModelFactory) {
        _viewModel = StateObject(wrappedValue: viewModelFactory.create())
    }
    
    public var body: some View {
        ReposScreenContent(
            state: viewModel.state,
            onAction: viewModel.onIntent(_:)
        )
    }
}

private struct ReposScreenContent: View {
    let state: ReposViewState
    let onAction: (ReposIntent) -> Void
    
    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Repos Screen!")
        }
    }
}

#Preview {
    ReposScreenContent(
        state: ReposViewState(),
        onAction: { _ in }
    )
}
