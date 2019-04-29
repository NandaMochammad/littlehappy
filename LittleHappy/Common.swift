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
            return DataManager.shared.name
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
    
    
    var text: String
    {
        switch  self {
        case .me:
            return "I"
        case .mother:
            return "MOTHER"
        case .father:
            return "FATHER"
        case .sister:
            return "SISTER"
        case .brother:
            return "BROTHER"
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
    
    var tips: String {
        switch self
        {
        case .joy:
            return "The person is happy"
        case .sadness:
            return "The person is sad"
        case .fear:
            return "The person is scared"
        case .disgust:
            return "The person is disgusted"
        case .anger:
            return "The person is angry"
        }
    }
    
    var text: String{
        switch self
        {
        case .joy:
            return "HAPPY"
        case .sadness:
            return "SAD"
        case .fear:
            return "SCARED"
        case .disgust:
            return "DISGUSTED"
        case .anger:
            return "ANGRY"
        }
    }
}

enum Gender: String {
    case male = "MALE"
    case female = "FEMALE"
    case unspecified = "UNSPECIFIED"
}

