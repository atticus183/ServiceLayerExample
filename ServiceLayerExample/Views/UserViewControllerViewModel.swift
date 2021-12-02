//
//  UserViewControllerViewModel.swift
//  ServiceLayerExample
//
//  Created by Josh Rondestvedt on 12/1/21.
//

import Combine
import Foundation

final class UserViewControllerViewModel: ObservableObject {
    @Published var users: [User] = []

    private let service: JsonPlaceholderServiceProtocol

    init(service: JsonPlaceholderServiceProtocol = JsonPlaceholderService()) {
        self.service = service

        retrieveUsers()
    }

    func retrieveUsers() {
        service.fetch(.users) { (response: Result<[User], Error>) in
            switch response {
            case .success(let retrievedUsers):
                self.users = retrievedUsers.sorted(by: { $0.name < $1.name })
            case .failure(let error):
                print("Error retrieving users: \(error.localizedDescription)")
            }
        }
    }
}
