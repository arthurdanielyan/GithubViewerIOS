import FeatureMain
import DomainAuth
import Navigation

struct MainViewModelFactoryImpl: MainViewModelFactory {
    private let appRouter: AppRouter
    
    init(
        appRouter: AppRouter
    ) {
        self.appRouter = appRouter
    }
    
    func create() -> MainViewModel {
        MainViewModel(
            appRouter: appRouter,
        )
    }
}
