import Foundation
import DomainAuth
import Navigation

@MainActor
public final class MainViewModel: ObservableObject {
    private let appRouter: AppRouter
    
    @Published private(set) var state: MainViewState = MainViewState()
    
    public init(
        appRouter: AppRouter,
    ) {
        self.appRouter = appRouter
    }
    
    func onIntent(_ intent: MainIntent) {
        switch intent {
        case .selectTab(let tab): state.activeTab = tab
        }
    }
}
