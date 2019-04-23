//
//  Score_Controller.swift
//  LittleHappy
//
//  Created by Kevin Abram on 23/04/19.
//  Copyright © 2019 littlehappy. All rights reserved.
//

import UIKit

class Score_Controller: UIViewController {

    @IBOutlet weak var star1: UIImageView!
    
    @IBOutlet weak var star2: UIImageView!
    
    @IBOutlet weak var star3: UIImageView!
    
    @IBOutlet weak var star4: UIImageView!
    
    @IBOutlet weak var star5: UIImageView!
    
    var firstImage = UIImage()
    var secondImage = UIImage()
    var thirdImage = UIImage()
    var fourthImage = UIImage()
    var fifthImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        star1.image = firstImage
        star2.image = secondImage
        star3.image = thirdImage
        star4.image = fourthImage
        star5.image = fifthImage
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
