//
//  Common.swift
//  LittleHappy
//
//  Created by William Sjahrial on 19/04/19.
//  Copyright © 2019 littlehappy. All rights reserved.
//

import Foundation

enum Person {
    case me
    case mother
    case father
    case sister
    case brother
    
    var description: String {
        switch self {
        case .me:
            return "Me"
        case .mother:
            return "Mother"
        case .father:
            return "Father"
        case .sister:
            return "Sister"
        case .brother:
            return "Brother"
        }
    }
}

enum Feeling {
    case joy
    case sadness
    case fear
    case disgust
    case anger
    
    var description: String {
        switch self {
        case .joy:
            return "Joy"
        case .sadness:
            return "Sadness"
        case .fear:
            return "Fear"
        case .disgust:
            return "Disgust"
        case .anger:
            return "Anger"
        }
    }
}

enum Gender: String {
    case male = "MALE"
    case female = "FEMALE"
    case unspecified = "UNSPECIFIED"
}

