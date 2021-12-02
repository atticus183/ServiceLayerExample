//
//  UserViewControllerViewModelTests.swift
//  ServiceLayerExampleTests
//
//  Created by Josh Rondestvedt on 12/2/21.
//

import Foundation
import XCTest

@testable import ServiceLayerExample

class UserViewControllerViewModelTests: XCTestCase {

    var mockJsonPlaceholderServiceProtocol: JsonPlaceholderServiceProtocol!
    var subject: UserViewControllerViewModel!

    override func setUp() {
        super.setUp()

        mockJsonPlaceholderServiceProtocol = MockJsonPlaceholderService()
        subject = UserViewControllerViewModel(service: mockJsonPlaceholderServiceProtocol)
    }

    func testFetchUsers() {
        //method `retrieveUsers` call in the UserViewControllerViewModel's init.  This occurs in the setUp method above.
        XCTAssertEqual(subject.users.count, 10)

        //`users` array is sorted A-Z
        let firstUser = subject.users.first!
        XCTAssertEqual(firstUser.id, 5)
        XCTAssertEqual(firstUser.name, "Chelsey Dietrich")
    }
}
