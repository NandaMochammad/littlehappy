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
    
    //Membuat variabel untuk menyimpan senderTag
    var senderTag : Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    
    //Membuat fungsi untuk menyimpan nilai button dengan "Tag"
    @IBAction func feelButton(_ sender: UIButton) {
        
        senderTag = sender.tag
        print(senderTag)
    }
    
    //Membuat fungsi untuk Button Lets Play
    @IBAction func letsPlay(_ sender: Any) {
        setFeelData(senderTag)
        
        performSegue(withIdentifier: "goToHome", sender: self)
    }
    
    /////////////////////////////
    
    //Membuat fungsi untuk menyiapkan data feeling
    func setFeelData(_ senderTag: Int){
        let userFeelModel = UserFeelModel()

        //Set model
        userFeelModel.kindOfFeels.append(feels[senderTag])
        userFeelModel.dateOfFeels.append(getDateTime()[0])
        userFeelModel.dateOfFeels.append(getDateTime()[1])
        
        print(userFeelModel.kindOfFeels.append(feels[senderTag]))
        print(userFeelModel.dateOfFeels.append(getDateTime()[0]))
        print(userFeelModel.dateOfFeels.append(getDateTime()[1]))

    } //func letsPlay

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

