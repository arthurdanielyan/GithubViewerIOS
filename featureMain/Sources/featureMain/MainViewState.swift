import Foundation

struct MainViewState {
    var activeTab: MainTab = MainTab.repos
}

enum MainTab {
    case repos
    case users
    case profile
}
