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
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var bioDataPicture: UIImageView!
    
    @IBOutlet weak var okButton: UIButton!
    
    
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
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        scrollView.setContentOffset(CGPoint(x: 0, y: 100), animated: true)
        return true
    }
    

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        let newLength = textField.text!.count + string.count - range.length
        
        updateButtonBasedOnText(length: newLength)
        
        return true
    }

    @IBAction func textFieldTapReturn(_ sender: UITapGestureRecognizer) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        view.endEditing(true)
    }
    
    @IBAction func okButton(_ sender: UIButton) {
        if yourNameTextBox.text != "" {
            DataManager.shared.name = yourNameTextBox.text!
            DataManager.shared.saveDataToUserDefaults()
        } else {
            DataManager.shared.name = ""
            DataManager.shared.saveDataToUserDefaults()
        }
    }
    
    func updateButtonBasedOnText(length: Int)
    {
        switch length
        {
        case 0:
            okButton.setImage(UIImage(named:"ok@DEFAULT@DEFAULT"), for: .normal)
            okButton.isEnabled = false
        default:
            okButton.setImage(UIImage(named:"ok"), for: .normal)
            okButton.isEnabled = true
        }
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
