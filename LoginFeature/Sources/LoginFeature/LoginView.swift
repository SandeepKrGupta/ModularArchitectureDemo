//
//  LoginView.swift
//  LoginModularDemo
//
//  Created by Sandeep on 20/08/26.
//

import SwiftUI
import UIComponents
import Networking

public struct LoginView: View {

    @StateObject private var viewModel : LoginViewModel

    @State private var username = ""
    @State private var password = ""

    public init(viewModel: LoginViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }


    public var body: some View {

        VStack(spacing: 20) {

            Text("Welcome Back")
                .font(.largeTitle.bold())

            TextField("Username", text: $username)
                .textFieldStyle(.roundedBorder)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            PrimaryButton(title: "Login") {

                Task {
                    await viewModel.login(
                        username: username,
                        password: password
                    )
                }
            }

            if viewModel.isLoading {
                ProgressView()
            }

            if viewModel.isAuthenticated {
                Text("✅ Authentication Successful")
                    .foregroundStyle(.green)
            }

            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundStyle(.red)
            }
        }
        .padding()
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel(authenticationService: PreviewAuthenticationService()))
}

final class PreviewAuthenticationService:
    AuthenticationServiceProtocol {

    func authenticate(
        username: String,
        password: String
    ) async throws -> Bool {
        true
    }
}
