import Foundation

struct HomeViewState {
    var activeTab: HomeTab = HomeTab.repos
}

enum HomeTab {
    case repos
    case users
    case profile
}
