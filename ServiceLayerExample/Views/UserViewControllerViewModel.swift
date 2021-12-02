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

    private func retrieveUsers() {
        service.fetchUsers { [weak self] result in
            switch result {
            case .success(let users):
                self?.users = users.sorted(by: { $0.name < $1.name })
            case .failure(let error):
                print("Error retrieving users: \(error.localizedDescription)")
            }
        }
    }
}
