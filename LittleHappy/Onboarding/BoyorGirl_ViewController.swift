//
//  BoyorGirl_ViewController.swift
//  LittleHappy
//
//  Created by Kevin Abram on 25/04/19.
//  Copyright © 2019 littlehappy. All rights reserved.
//

import UIKit

class BoyorGirl_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Boy_Click(_ sender: UIButton) {
        //If boy is clicked, set the data of user defaults to boy
//        UserDefaults.standard.set(Gender.male, forKey: DataManager.shared.gender)
        DataManager.shared.gender = .male
        performSegue(withIdentifier: "DailyFeelSegue", sender: nil)
    }
    
    @IBAction func Girl_Click(_ sender: UIButton) {
        //If girl is clicked, set the data of user defaults to girl
//        UserDefaults.standard.set(Gender.female, forKey: DataManager.shared.gender)
        DataManager.shared.gender = .female
        performSegue(withIdentifier: "DailyFeelSegue", sender: nil)
    }
    
    func saveData()
    {
        DataManager.shared.saveDataToUserDefaults()
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
