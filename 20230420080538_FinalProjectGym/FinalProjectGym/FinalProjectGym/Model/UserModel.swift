//
//  UserModel.swift
//  MultiPages With Navigation Controller
//
//  Created by Daniel Carvalho on 14/02/23.
//

import Foundation

class UserModel {
    
    static private var generatorId : Int = 0
    
    public var id : Int = 0
    
    public var dob : String
    public var username : String
    public var password : String
    
    // constructor "like"
    init(dob :  String,username : String, password : String) {
        self.dob = dob
        self.username = username
        self.password = password
    }
    
    static func getNextId() -> Int {
        UserModel.generatorId += 1
        return UserModel.generatorId
    }
    
    
    
    
}
