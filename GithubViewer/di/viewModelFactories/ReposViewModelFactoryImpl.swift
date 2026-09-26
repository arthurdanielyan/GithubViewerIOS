import FeatureRepos
import DomainAuth
import Navigation

struct ReposViewModelFactoryImpl: ReposViewModelFactory {
    private let appRouter: AppRouter
    
    init(
        appRouter: AppRouter
    ) {
        self.appRouter = appRouter
    }

    func create() -> ReposViewModel {
        ReposViewModel(
            appRouter: appRouter,
        )
    }
}
