import Foundation
import DomainAuth
import Navigation

@MainActor
public final class HomeViewModel: ObservableObject {
    private let appRouter: AppRouter
    
    @Published private(set) var state: HomeViewState = HomeViewState()
    
    public init(
        appRouter: AppRouter,
    ) {
        self.appRouter = appRouter
    }
    
    func onIntent(_ intent: HomeIntent) {
        switch intent {
        case .selectTab(let tab): state.activeTab = tab
        }
    }
}
