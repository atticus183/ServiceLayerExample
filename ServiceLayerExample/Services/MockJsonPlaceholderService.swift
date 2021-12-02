//
//  MockJsonPlaceholderService.swift
//  ServiceLayerExampleTests
//
//  Created by Josh Rondestvedt on 12/2/21.
//

import Foundation

@testable import ServiceLayerExample

final class MockJsonPlaceholderService: JsonPlaceholderServiceProtocol {

    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        let pathString = Bundle(for: type(of: self)).path(forResource: "users", ofType: "json")!
        let url = URL(fileURLWithPath: pathString)
        let jsonData = try! Data(contentsOf: url)
        let users = try! JSONDecoder.userDecoder().decode([User].self, from: jsonData)
        completion(.success(users))
    }
}
