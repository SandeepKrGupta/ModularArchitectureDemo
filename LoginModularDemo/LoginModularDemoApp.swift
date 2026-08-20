//
//  LoginModularDemoApp.swift
//  LoginModularDemo
//
//  Created by Sandeep on 20/08/26.
//

import SwiftUI
import LoginFeature
import Networking
@main
struct LoginModularDemoApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView(viewModel: LoginViewModel(authenticationService: MockAuthenticationService()))
        }
    }
}

final class MockAuthenticationService:
    AuthenticationServiceProtocol {

    func authenticate(
        username: String,
        password: String
    ) async throws -> Bool {
        try await Task.sleep(for: .seconds(1))
        return username == "admin" && password == "123456"

    }
}
