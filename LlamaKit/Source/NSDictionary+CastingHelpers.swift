//
//  NSDictionary+CastingHelpers.swift
//  LlamaKit
//
//  Created by Adam Cooke on 09/10/2015.
//
//  This extension adds some methods to NSDictionary to assist with accessing 
//  values without the need to constantly cast manually. They all return optionals
//  for cases where the value is not present or the value in the dictionary cannot
//  be casted to the requested value.
//

import Foundation

public extension NSDictionary {
    
    //
    // Strings
    //
    
    func stringForKey(_ key: String) -> String? {
        return self.value(forKey: key) as? String
    }
    
    func stringForKeyPath(_ keyPath: String) -> String? {
        if let value = self.value(forKeyPath: keyPath) {
            return value as? String
        } else {
            return nil
        }
    }
    
    //
    // Integer
    //
    func intForKey(_ key: String) -> Int? {
        return self.value(forKey: key) as? Int
    }
    
    func intForKeyPath(_ keyPath: String) -> Int? {
        if let value = self.value(forKeyPath: keyPath) {
            return value as? Int
        } else {
            return nil
        }
    }
    
    //
    // Dictionary
    //
    
    func dictForKey(_ key: String) -> NSDictionary? {
        return self.value(forKey: key) as? NSDictionary
    }
    
    func dictForKeyPath(_ keyPath: String) -> NSDictionary? {
        if let value = self.value(forKeyPath: keyPath) {
            return value as? NSDictionary
        } else {
            return nil
        }
    }
    
    //
    // Array of Dictionaries
    //
    
    func dictArrayForKey(_ key: String) -> [NSDictionary]? {
        return self.value(forKey: key) as? [NSDictionary]
    }
    
    func dictArrayForKeyPath(_ keyPath: String) -> [NSDictionary]? {
        if let value = self.value(forKeyPath: keyPath) {
            return value as? [NSDictionary]
        } else {
            return nil
        }
    }



}
