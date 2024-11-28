//
//  AuthenticationViewModelTests.swift
//  InstagramCloneTests
//
//  Created by Mochamad Ikhsan Nurdiansyah on 28/11/24.
//

import XCTest
@testable import InstagramClone

final class AuthenticationViewModelTests: XCTestCase {
    func testLoginViewModel_isValidForm() {
        //Given and when
        let viewModel = LoginViewModel(email: "test@mail.com", password: "12345678")
        
        //then
        
        XCTAssertTrue(viewModel.isValidForm)
        XCTAssertEqual(viewModel.buttonBackgroundColor, UIColor.systemBlue)
        
    }
    
    func testLoginViewModel_isInvalidForm() {
        //Given and when
        let viewModel = LoginViewModel(email: "", password: "12345678")
        
        //then
        
        XCTAssertFalse(viewModel.isValidForm)
        XCTAssertEqual(viewModel.buttonBackgroundColor, UIColor.systemBlue.withAlphaComponent(0.6))
        
    }
    
}
