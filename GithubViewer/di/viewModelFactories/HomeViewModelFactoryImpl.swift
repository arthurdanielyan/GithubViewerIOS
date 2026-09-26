import FeatureHome
import DomainAuth
import Navigation

struct HomeViewModelFactoryImpl: HomeViewModelFactory {
    private let appRouter: AppRouter
    
    init(
        appRouter: AppRouter
    ) {
        self.appRouter = appRouter
    }
    
    func create() -> HomeViewModel {
        HomeViewModel(
            appRouter: appRouter,
        )
    }
}
