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
            return "When you’re happy, share your happiness with your family and friends."
        case .sadness:
            return "Don’t let your sadness take over your precious day. \nShare stories with your parents or friends, get their support and love to make you feel better!"
        case .fear:
            return "Go to your parents and share your story. Sometimes it is good to challenge yourself,  face your fears and be a brave kid!"
        case .disgust:
            return "Notice why you are feeling disgusted. \nTry to use your imagination to think of it in a good way!"
        case .anger:
            return "Oh no! Take a deep breath and try to calm yourself down. Never take action when your feelings are out of control."
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

var soundPlayed: Bool = false

