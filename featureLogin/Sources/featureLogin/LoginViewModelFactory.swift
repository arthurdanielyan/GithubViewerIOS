//
//  LoginViewModelFactory.swift
//  featureLogin
//
//  Created by Artur Danielyan on 20.09.26.
//

public protocol LoginViewModelFactory {
    
    func create() -> LoginViewModel
}
