//
//  File.swift
//
//
//  Created by Chirag Vekariya on 05/06/24.
//

import Foundation

public class DatabaseModuleImplementation: DatabaseModule {
    
    public init() {}
    
    public func createUser(_ user: User) {
        UserDefaultsManager.shared.saveObject(user, forKey: UserDefaultKey.keyUserInfo)
    }
    
    public func getUser() -> User? {
        guard let userDetail: User = UserDefaultsManager().loadObject(forKey: UserDefaultKey.keyUserInfo) else { return nil}
        return userDetail
    }
    
    public func updateUser(_ user: User) {
        UserDefaultsManager.shared.removeObject(forKey: UserDefaultKey.keyUserInfo)
        UserDefaultsManager.shared.saveObject(user, forKey: UserDefaultKey.keyUserInfo)
    }
    
    public func deleteUser() {
        UserDefaultsManager.shared.removeAllObject()
    }
}
