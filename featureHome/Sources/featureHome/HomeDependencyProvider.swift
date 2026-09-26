import FeatureRepos

public protocol HomeDependencyProvider {
    
    func getHomeViewModelFactory() -> HomeViewModelFactory
    
    func getReposViewModelFactory() -> ReposViewModelFactory
}
