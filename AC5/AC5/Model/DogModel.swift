//
//  DogModel.swift
//  AC5
//
//  Created by Admin on 08/02/2023.
//

import Foundation
struct DataModel: Codable {
    var status : String?
    var message: Dictionary<String,[String]>?
}

struct DogDataModel : Codable {
    var data:[Dog]?
}
    
struct Dog: Codable {
    var breed: String?
}
