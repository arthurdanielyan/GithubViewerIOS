//
//  DependencyProvider.swift
//  GithubViewer
//
//  Created by Artur Danielyan on 14.09.26.
//

protocol DependencyProvider<T> {
    associatedtype T
    
    func get() -> T
}

struct SingletonDependencyProvider<T>: DependencyProvider {

    private let instance: T
    
    init(_ instance: T) {
        self.instance = instance
    }
    
    init(factory: () -> T) {
        self.instance = factory()
    }

    func get() -> T {
        return instance
    }
}

struct NewDependencyProvider<T>: DependencyProvider {
    
    private let factory: () -> T
    
    init (_ factory: @escaping () -> T) {
        self.factory = factory
    }
    
    func get() -> T {
        return factory()
    }
}
