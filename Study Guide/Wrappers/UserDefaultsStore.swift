//
//  UserDefaults.swift
//  Study Guide
//
//  Created by Erick Sanchez on 11/1/21.
//

import Foundation
import UIKit

class UserDefaultsStore {

    // TODO: Store key-value pairs
    func store() {
        UserDefaults.standard.object(forKey: "key")
    }
    // TODO: Read key-value pairs
    func read<Value>() -> Value? {
        guard let readThis = UserDefaults.standard.object(forKey: "key") else { return nil }
        return readThis as? Value
    }
    // TODO: Delete keys
    func delete() {
        UserDefaults.standard.removeObject(forKey: "key")
    }
    
}
