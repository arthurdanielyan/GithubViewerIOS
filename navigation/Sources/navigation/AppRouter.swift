//
//  File.swift
//  navigation
//
//  Created by Artur Danielyan on 26.09.26.
//

import Foundation

public protocol AppRouter {
    
    func navigate(_ to: any Destination)
    
    func pop()
}
