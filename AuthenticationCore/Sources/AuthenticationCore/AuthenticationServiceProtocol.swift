//
//  AuthenticationServiceProtocol.swift
//  AuthenticationCore
//
//  Created by Sandeep on 20/08/26.
//

public protocol AuthenticationServiceProtocol:Sendable {
    func authenticate(
        username: String,
        password: String
    ) async throws -> Bool
}
