//
//  AuthenticationService.swift
//  LoginModularDemo
//
//  Created by Sandeep on 20/08/26.
//

import Foundation

import AuthenticationCore

public final class AuthenticationService: AuthenticationServiceProtocol,Sendable {

    public init() {}

    public func authenticate(
        username: String,
        password: String
    ) async throws -> Bool {

        // Actual API call

        try await Task.sleep(for: .seconds(1))

        return username == "admin" && password == "123456"
    }
}
