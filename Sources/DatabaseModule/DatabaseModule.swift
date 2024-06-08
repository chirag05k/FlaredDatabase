//
//  File.swift
//
//
//  Created by Chirag Vekariya on 05/06/24.
//

public protocol DatabaseModule {
    // User
    func createUser(_ user: User)
    func getUser() -> User?
    func updateUser(_ user: User)
    func deleteUser()
}
