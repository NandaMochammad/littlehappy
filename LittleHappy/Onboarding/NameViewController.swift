//
//  NameViewController.swift
//  LittleHappy
//
//  Created by William Sjahrial on 25/04/19.
//  Copyright © 2019 littlehappy. All rights reserved.
//

import UIKit

class NameViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var yourNameTextBox: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yourNameTextBox.delegate = self
        // Do any additional setup after loading the view.
    }
    
        func textFieldShouldReturn(_ textField: UITextField) -> Bool
        {
            textField.resignFirstResponder()
            return true
        }

    @IBAction func textFieldTapReturn(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func okButton(_ sender: UIButton) {
        DataManager.shared.name = yourNameTextBox.text!
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
