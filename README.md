# ModularArchitectureDemo

A sample SwiftUI application demonstrating **Modular iOS Architecture** using:

- SwiftUI
- Swift Concurrency
- Swift Package Manager (SPM)
- Dependency Injection
- Protocol-Oriented Programming
- Unit Testing
- Feature-based modularization

The project demonstrates how to decouple features from heavy dependencies such as Networking and build reusable modules that can be developed and tested independently.

---

## Why Modular Architecture?

Monolithic iOS codebases don't necessarily fail because of bad code.

As an application and engineering team grow, other problems start appearing:

- ⏳ Longer build times
- 🔀 Frequent merge conflicts
- 👥 Multiple teams modifying the same target
- 🧪 Difficult feature-level testing
- 🔗 Tight coupling between features
- 🚧 Difficult code ownership
- 📦 Large dependency graphs

Modularization addresses these problems by breaking the application into smaller, well-defined modules.

The goal is not simply to create more folders.

> **The goal of modularization is to create clear boundaries and reduce dependencies.**

---

# Architecture

The sample application contains the following modules:

```text
LoginModularDemo
│
├── App
│
├── LoginFeature
│   ├── LoginView
│   └── LoginViewModel
│
├── UIComponents
│   └── PrimaryButton
│
├── AuthenticationCore
│   └── AuthenticationServiceProtocol
│
└── Networking
    └── AuthenticationService
