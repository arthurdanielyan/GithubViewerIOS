import Foundation
import DomainAuth
import Navigation

@MainActor
public final class ReposViewModel: ObservableObject {
    private let appRouter: AppRouter
    
    @Published private(set) var state = ReposViewState()
    
    public init(
        appRouter: AppRouter,
    ) {
        self.appRouter = appRouter
    }
    
    func onIntent(_ intent: ReposIntent) {
        switch intent {
        
        }
    }
}
