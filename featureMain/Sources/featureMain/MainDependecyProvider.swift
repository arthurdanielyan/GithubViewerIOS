import FeatureRepos

public protocol MainDependencyProvider {
    
    func getMainViewModelFactory() -> MainViewModelFactory
    
    func getReposViewModelFactory() -> ReposViewModelFactory
}
