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
    
    @IBOutlet weak var sunImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataManager.shared.loadDataFromUserDefaults()

        print("Data Saved \n", DataManager.shared.kindOfFeels,"\n",DataManager.shared.dateOfFeels, "\n", DataManager.shared.timeOfFeels)


        //Do the basic appear and disappear animation

        
        // Do any additional setup after loading the view.
    }
        
    func animateText()
        {
            UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.repeat, .autoreverse], animations: {
                self.touchToStartLabel.alpha = 0
            }, completion: nil)
        }
    
    func animateSun()
    {
        UIView.animate(withDuration: 1000, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0.0001, animations: {
            self.sunImage.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }, completion: nil)
    }
    
    func rotateAnimation(imageview: UIImageView, duration: CFTimeInterval = 30)
    {
        let rotateAnimation = CABasicAnimation(keyPath:
            "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Float.pi * 2)
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount = .greatestFiniteMagnitude
        
        imageview.layer.add(rotateAnimation, forKey: nil)
    }
    
    @IBAction func skip_onboarding(_ sender: UIButton) {
        
        //Prints the value of the app
        let name = UserDefaults.standard.string(forKey: "user_first_time")
        
        //This checks the name, and do condition if the onboarding should be skipped.
        if name == nil
        {
            // Do the segue to the onboarding here
        }
        else
        {
            //Do the segue to skip onboarding here
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

extension Onboarding_Controller_1 {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    override var shouldAutorotate: Bool {
        return UIDevice.current.orientation != .portrait
    }
}

extension NameViewController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    override var shouldAutorotate: Bool {
        return UIDevice.current.orientation != .portrait
    }
}

extension IntroViewController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    override var shouldAutorotate: Bool {
        return UIDevice.current.orientation != .portrait
    }
}


extension BoyorGirl_ViewController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    override var shouldAutorotate: Bool {
        return UIDevice.current.orientation != .portrait
    }
}
