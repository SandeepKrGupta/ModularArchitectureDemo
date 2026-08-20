import XCTest
@testable import LoginFeature
import AuthenticationCore
final class LoginFeatureTests: XCTestCase {
    var sut : LoginViewModel!
    
    @MainActor func testLoginFunctionSuccess(){
        sut = LoginViewModel(authenticationService: MockAuthenticationService())
        
        Task{
            await sut.login(username: "admin", password: "123456")
            XCTAssertTrue(sut.isAuthenticated)
        }
        
    }
    @MainActor func testLoginFunctionFailure(){
        sut = LoginViewModel(authenticationService: MockAuthenticationService())
        
        Task{
            await sut.login(username: "admin", password: "admin")
            XCTAssertTrue(sut.isAuthenticated)
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
