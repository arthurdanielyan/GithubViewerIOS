import FeatureRepos
import DomainAuth
import Navigation

struct MainViewModelFactoryImpl: MainViewModelFactory {    
    private let appRouter: AppRouter
    private let getAuthStateUseCase: GetAuthStateUseCase
    
    init(
        appRouter: AppRouter,
        getAuthStateUseCase: GetAuthStateUseCase,
    ) {
        self.appRouter = appRouter
        self.getAuthStateUseCase = getAuthStateUseCase
    }

    func create() -> MainViewModel {
        MainViewModel(
            appRouter: appRouter,
            getAuthStateUseCase: getAuthStateUseCase,
        )
    }
}
