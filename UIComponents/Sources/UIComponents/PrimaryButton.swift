//
//  PrimaryButton.swift
//  LoginModularDemo
//
//  Created by Sandeep on 20/08/26.
//

import SwiftUI

public struct PrimaryButton: View {

    private let title: String
    private let action: () -> Void

    public init(
        title: String,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 15, weight: .bold))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.red)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}
