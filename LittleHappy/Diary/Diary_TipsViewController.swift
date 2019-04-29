//
//  Diary_TipsViewController.swift
//  LittleHappy
//
//  Created by Nanda Mochammad on 29/04/19.
//  Copyright © 2019 littlehappy. All rights reserved.
//

import UIKit

class Diary_TipsViewController: UIViewController {

    @IBOutlet weak var tipsLabel: UILabel!
    
    @IBOutlet weak var viewTips: UIView!
    var tipsText = String()
    
    @IBOutlet weak var okButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewTips.backgroundColor = UIColor(patternImage: UIImage(named: "Tips Box 2.png")!)
        okButton.setImage(UIImage(named: "ok"), for: .normal)
        tipsLabel.text = tipsText
        // Do any additional setup after loading the view.
    }
    
    @IBAction func okClick(_ sender: UIButton) {
        
        //dismiss(animated: true, completion: nil)
        
        performSegue(withIdentifier: "goToFamily", sender: self)

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
