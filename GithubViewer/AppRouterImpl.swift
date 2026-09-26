//
//  AppRouterImpl.swift
//  GithubViewer
//
//  Created by Artur Danielyan on 26.09.26.
//

import SwiftUI
import Combine
import Navigation

class AppRouterImpl: AppRouter, ObservableObject {
    
    @Published public var stack = NavigationPath()
    
    func navigate(_ to: any Destination) {
        stack.append(to)
    }
    
    func pop() {
        if stack.count > 0 {
            stack.removeLast(1)
        }
    }
}
