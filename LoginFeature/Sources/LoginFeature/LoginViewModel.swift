//
//  LoginViewModel.swift
//  LoginModularDemo
//
//  Created by Sandeep on 20/08/26.
//

import Foundation
public import Combine
import Networking


@MainActor
public final class LoginViewModel: ObservableObject {

    @Published public private(set) var isAuthenticated = false
    @Published public private(set) var isLoading = false
    @Published public var errorMessage: String?

    private let authenticationService: AuthenticationServiceProtocol

    public init(
        authenticationService: AuthenticationServiceProtocol
    ) {
        self.authenticationService = authenticationService
    }

    public func login( username: String, password: String ) async {
        isLoading = true
        errorMessage = nil

        defer {
            isLoading = false
        }

        do {
            isAuthenticated = try await authenticationService.authenticate(
                username: username,
                password: password
            )
        } catch {
            errorMessage = "Authentication Failed!"
            isAuthenticated = false
        }
    }
}
