//
//  Onboarding_Controller_1.swift
//  LittleHappy
//
//  Created by Kevin Abram on 24/04/19.
//  Copyright © 2019 littlehappy. All rights reserved.
//

import UIKit

class Onboarding_Controller_1: UIViewController {
    
    @IBOutlet weak var touchToStartLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.repeat, .autoreverse], animations: {
            
            self.touchToStartLabel.alpha = 0
            
        }, completion: nil)
        // Do any additional setup after loading the view.
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
