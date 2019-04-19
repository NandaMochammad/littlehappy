//
//  UserModel.swift
//  LittleHappy
//
//  Created by Nanda Mochammad on 18/04/19.
//  Copyright © 2019 littlehappy. All rights reserved.
//

import Foundation

class UserFeelModel{
    //Membuat Variabel yang menyimpan nama user
    var user : String = ""
    
    //Membuat dictionary yang didalamnya berupa array dengan nama [Feeling:[WktuFeel]]
    var feeling : [String:[String]] = [:]
    
    var kindOfFeels : [String] = []
    var dateOfFeels : [String] = []
    var timeOfFeels : [String] = []

}
