import Foundation
import Combine
import Navigation
import DomainAuth

@MainActor
final class MainViewModel: ObservableObject {
    private let appRouter: AppRouter
    private let getAuthStateUseCase: GetAuthStateUseCase
    
    init(
        appRouter: AppRouter,
        getAuthStateUseCase: GetAuthStateUseCase,
    ) {
        self.appRouter = appRouter
        self.getAuthStateUseCase = getAuthStateUseCase
    }
    
    func loadAuthState() {
        Task {
            if await getAuthStateUseCase.execute() {
                appRouter.navigate(HomeDestination())
            } else {
                appRouter.navigate(LoginDestination())
            }
        }
    }
}
