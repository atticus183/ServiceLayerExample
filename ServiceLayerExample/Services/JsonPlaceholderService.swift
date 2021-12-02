//
//  JsonPlaceholderService.swift
//  ServiceLayerExample
//
//  Created by Josh Rondestvedt on 12/1/21.
//

import Foundation

protocol JsonPlaceholderServiceProtocol {
    func fetch<T: Codable>(_ endpoint: JsonPlaceholderService.Endpoint,
                           completion: @escaping (Result<[T], Error>) -> Void)
}

final class JsonPlaceholderService: JsonPlaceholderServiceProtocol {

    // MARK: Types

    enum Endpoint: String {
        case users = "/users"
    }

    // MARK: Properties

    private let baseUrlString = "https://jsonplaceholder.typicode.com"

    private let urlSession: URLSession

    // MARK: Initialization

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    // MARK: Methods

    func fetch<T: Codable>(_ endpoint: Endpoint, completion: @escaping (Result<[T], Error>) -> Void) {

        guard let url = URL(string: baseUrlString + endpoint.rawValue) else { return }

        urlSession.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }

            do {
                let response = try JSONDecoder().decode([T].self, from: data!)
                completion(.success(response))
            } catch let err {
                completion(.failure(err))
            }
        }.resume()
    }
}
