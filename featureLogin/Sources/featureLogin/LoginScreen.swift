//
//  LoginScreen.swift
//  GithubViewer
//
//  Created by Artur Danielyan on 19.09.26.
//

import SwiftUI

public struct LoginScreen: View {
    @StateObject private var viewModel: LoginViewModel
    
    public init(loginViewModelFactory: LoginViewModelFactory) {
        _viewModel = StateObject(wrappedValue: loginViewModelFactory.create())
    }

    public var body: some View {
        LoginScreenContent(
            state: viewModel.state,
            onAction: viewModel.onIntent(_:)
        )
    }
}

private struct LoginScreenContent: View {
    let state: LoginViewState
    let onAction: (LoginIntent) -> Void
    
    public var body: some View {
        VStack {
            TextField(
                "Github access token",
                text: Binding(
                    get: { state.tokenInput },
                    set: {
                        onAction(.tokenInputChange($0))
                    }
                ),
                onEditingChanged: { _ in }
            )
            .padding(.top, 16)
            .padding()
            
            HStack {
                Spacer()
                Button(
                    action: {
                        onAction(LoginIntent.loginClick)
                    }
                ) {
                    if state.isLoading {
                        ProgressView()
                    } else {
                        Text("Login")
                    }
                }
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    LoginScreenContent(
        state: LoginViewState(),
        onAction: { _ in }
    )
}
