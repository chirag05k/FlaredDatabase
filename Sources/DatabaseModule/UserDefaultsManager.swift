//
//  File.swift
//
//
//  Created by Chirag Vekariya on 05/06/24.
//

import Foundation

public class UserDefaultsManager {
    private var userDefaults = UserDefaults.standard
    
    // static properties get lazy evaluation and dispatch_once_t for free
    private struct Static {
        static let instance = UserDefaultsManager()
    }
    // this is the Swift way to do singletons
    class var shared: UserDefaultsManager {
        return Static.instance
    }
    
    func saveObject<T: Codable>(_ object: T, forKey key: String) {
        do {
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(object)
            userDefaults.set(encodedData, forKey: key)
            userDefaults.synchronize()
        } catch {
            print("Error while encoding and saving object: \(error)")
        }
    }
    
    func loadObject<T: Codable>(forKey key: String) -> T? {
        guard let data = userDefaults.data(forKey: key) else {
            return nil
        }
        
        do {
            let decoder = JSONDecoder()
            let decodedObject = try decoder.decode(T.self, from: data)
            return decodedObject
        } catch {
            print("Error while decoding object: \(error)")
            return nil
        }
    }
    
    func removeObject(forKey key: String) {
        userDefaults.removeObject(forKey: key)
        userDefaults.synchronize()
    }
    
    func getUserId() -> Int {
        guard let valueUserId: Int = UserDefaultsManager.shared.loadObject(forKey: UserDefaultKey.keyUserId) else { return 0 }
        return valueUserId
    }
    
    func isExistingUser() -> Bool {
        guard let valueisExistingUser: Bool = UserDefaultsManager.shared.loadObject(forKey: UserDefaultKey.keyIsExistingOrNewUser) else { return false }
        return valueisExistingUser
    }
    
    func removeAllObject() {
        if let domain = Bundle.main.bundleIdentifier {
            userDefaults.removePersistentDomain(forName: domain)
            userDefaults.synchronize()
        }
    }
}

// MARK:   UserDefaultKey
public struct UserDefaultKey {
    static let keyUserInfo                                      = "UserInfo"
    static let keyUserId                                        = "keyUserId"
    static let keyIsExistingOrNewUser                           = "keyIsExistingOrNewUser"
}
