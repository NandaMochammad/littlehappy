//
//  ViewController.swift
//  LittleHappy
//
//  Created by Nanda Mochammad on 18/04/19.
//  Copyright © 2019 littlehappy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    ///////////////////////////
    //Declare Instance Variable
    
    //Menyimpan nilai feeling pada array
    var feels = ["Happy", "Sad", "Angry", "Fear", "Disgust"]
    
    var kindOfFeels : [String] = ["Angry", "Sad", "Happy"]
    var dateOfFeels : [String] = ["21.04.2019", "21.04.2019", "21.04.2019"]
    var timeOfFeels : [String] = ["17:22:28", "17:22:27", "17:22:26"]
    
    //Membuat User Default untuk menyimpan data array
    let defaults = UserDefaults.standard

    
    //Membuat variabel untuk menyimpan senderTag
    var senderTag : Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let feels = defaults.array(forKey: "SavedFeelsAray") as? [String]{
            kindOfFeels = feels
        }
        if let feels1 = defaults.array(forKey: "SavedDateArray") as? [String]{
            dateOfFeels = feels1
            
        }
        if let feels2 = defaults.array(forKey: "SavedTimeArray") as? [String]{
            timeOfFeels = feels2
        }
        
    }

    
    //Membuat fungsi untuk menyimpan nilai button dengan "Tag"
    @IBAction func feelButton(_ sender: UIButton) {
        
        senderTag = sender.tag
        
    }
    
    //Membuat fungsi untuk Button Lets Play
    @IBAction func letsPlay(_ sender: Any) {
        setFeelData(senderTag)
        performSegue(withIdentifier: "goToHome", sender: self)
    }
    
    /////////////////////////////
    
    //Membuat fungsi untuk menyiapkan data feeling
    func setFeelData(_ senderTags: Int){
        
        kindOfFeels.append(feels[senderTags])
        dateOfFeels.append(getDateTime()[0])
        timeOfFeels.append(getDateTime()[1])
        
        
        //Save data to userDefault
        defaults.set(kindOfFeels, forKey: "SavedFeelsAray")
        defaults.set(dateOfFeels, forKey: "SavedDateArray")
        defaults.set(timeOfFeels, forKey: "SavedTimeArray")

        
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

