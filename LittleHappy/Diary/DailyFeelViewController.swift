//
//  DailyFeelViewController.swift
//  LittleHappy
//
//  Created by Nanda Mochammad on 18/04/19.
//  Copyright © 2019 littlehappy. All rights reserved.
//

import UIKit

class DailyFeelViewController: UIViewController {
    
    ///////////////////////////
    //Declare Instance Variable
    
    //Menyimpan nilai feeling pada array
    var feels = ["Happy", "Sad", "Angry", "Fear", "Disgust"]
    
//    var kindOfFeels : [String] = ["Angry", "Sad", "Happy"]
//    var dateOfFeels : [String] = ["21.04.2019", "21.04.2019", "21.04.2019"]
//    var timeOfFeels : [String] = ["17:22:28", "17:22:27", "17:22:26"]
    
    //Membuat User Default untuk menyimpan data array
    let defaults = UserDefaults.standard

    
    //Membuat variabel untuk menyimpan senderTag
    var senderTag : Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        DataManager.shared.loadDataFromUserDefaults()
        
//        print("Kind Of Feels : \(DataManager.shared.kindOfFeels) \nDate of Feels \(DataManager.shared.dateOfFeels) \nTime of Feels \(DataManager.shared.timeOfFeels)")

        
    }

    
    //Membuat fungsi untuk menyimpan nilai button dengan "Tag"
    @IBAction func feelButton(_ sender: UIButton) {
        
        senderTag = sender.tag
//        print(senderTag)
        
    }
    
    //Membuat fungsi untuk Button Lets Play
    @IBAction func letsPlay(_ sender: Any) {
        setFeelData(senderTag)
        performSegue(withIdentifier: "goToHome", sender: self)
    }
    
    /////////////////////////////
    
    //Membuat fungsi untuk menyiapkan data feeling
    func setFeelData(_ senderTags: Int){
        
        DataManager.shared.kindOfFeels.append(feels[senderTags])
        DataManager.shared.dateOfFeels.append(getDateTime()[0])
        DataManager.shared.timeOfFeels.append(getDateTime()[1])
        
        
        DataManager.shared.saveDataToUserDefaults()
        
    }

    //Membuat fungsi untuk mengambil waktu feeling
    func getDateTime()->[String]{

        let date = Date()
        let dateFormatter = DateFormatter()
        var result = [String]()
        
        dateFormatter.dateFormat = "dd.MM.yyyy"
        result.append(dateFormatter.string(from: date))
        
        dateFormatter.dateFormat = "HH:mm:ss"
        result.append(dateFormatter.string(from: date))
        
        return result
    } //func getDateTime
}
