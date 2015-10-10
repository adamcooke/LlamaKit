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
    
    public func stringForKey(key: String) -> String? {
        return self.valueForKey(key) as? String
    }
    
    public func stringForKeyPath(keyPath: String) -> String? {
        if let value = self.valueForKeyPath(keyPath) {
            return value as? String
        } else {
            return nil
        }
    }
    
    //
    // Integer
    //
    public func intForKey(key: String) -> Int? {
        return self.valueForKey(key) as? Int
    }
    
    public func intForKeyPath(keyPath: String) -> Int? {
        if let value = self.valueForKeyPath(keyPath) {
            return value as? Int
        } else {
            return nil
        }
    }
    
    //
    // Dictionary
    //
    
    public func dictForKey(key: String) -> NSDictionary? {
        return self.valueForKey(key) as? NSDictionary
    }
    
    public func dictForKeyPath(keyPath: String) -> NSDictionary? {
        if let value = self.valueForKeyPath(keyPath) {
            return value as? NSDictionary
        } else {
            return nil
        }
    }
    
    //
    // Array of Dictionaries
    //
    
    public func dictArrayForKey(key: String) -> [NSDictionary]? {
        return self.valueForKey(key) as? [NSDictionary]
    }
    
    public func dictArrayForKeyPath(keyPath: String) -> [NSDictionary]? {
        if let value = self.valueForKeyPath(keyPath) {
            return value as? [NSDictionary]
        } else {
            return nil
        }
    }



}