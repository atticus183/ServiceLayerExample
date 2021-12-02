//
//  User.swift
//  ServiceLayerExample
//
//  Created by Josh Rondestvedt on 12/1/21.
//

import Foundation

struct User: Codable {
    var id: Int
    var name: String
    var username: String
    var email: String
}
