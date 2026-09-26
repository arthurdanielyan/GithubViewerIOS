//
//  Binding.swift
//  GithubViewer
//
//  Created by Artur Danielyan on 26.09.26.
//

import SwiftUI

func binding<Value>(
    _ get: @autoclosure @escaping () -> Value,
    send: @escaping (Value) -> Void
) -> Binding<Value> {
    Binding(
        get: get,
        set: { send($0) }
    )
}
