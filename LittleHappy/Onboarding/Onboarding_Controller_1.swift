//
//  Onboarding_Controller_1.swift
//  LittleHappy
//
//  Created by Kevin Abram on 24/04/19.
//  Copyright © 2019 littlehappy. All rights reserved.
//

import UIKit
import AVFoundation

class Onboarding_Controller_1: UIViewController, AVAudioPlayerDelegate {
    
    var player: AVAudioPlayer?
    
    @IBOutlet weak var touchToStartLabel: UILabel!
    
    @IBOutlet weak var sunPath: UIImageView!
    
    @IBOutlet weak var littleHappyText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataManager.shared.loadDataFromUserDefaults()

        print("Data Saved \n", DataManager.shared.kindOfFeels,"\n",DataManager.shared.dateOfFeels, "\n", DataManager.shared.timeOfFeels)
        
        littleHappyText.attributedText = NSAttributedString(string: "LITTLE HAPPY" ,attributes:[ NSAttributedString.Key.kern: 10])
        
        if soundPlayed == false
        {
        playSound()
        }

        //Do the basic appear and disappear animation

        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //littleHappyText.addTextSpacing(spacing: 10)
        
        animateText()
        
        rotateAnimation(imageview: sunPath)
        
    }
        
    func animateText()
        {
            UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.repeat, .autoreverse], animations: {
                self.touchToStartLabel.alpha = 0
            }, completion: nil)
        }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool)
    {
        print("done")
    }
    
//    func animateSun()
//    {
//        UIView.animate(withDuration: 1000, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0.0001, animations: {
//            self..transform = CGAffineTransform(rotationAngle: CGFloat.pi)
//        }, completion: nil)
//    }
    
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
    
    
    func playSound() {
        let url = Bundle.main.url(forResource: "The_Farmer_In_The_Dell_Instrumental", withExtension: "mp3")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.delegate = self
            player.numberOfLoops = -1
            player.play()
            
            soundPlayed = true
            
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    
    
   // @IBAction func skip_onboarding(_ sender: UIButton) {
        
        //Prints the value of the app

        
        //This checks the name, and do condition if the onboarding should be skipped.

            //Do the segue to skip onboarding here
      //  }
    @IBAction func onboardingClick(_
        sender: UIButton) {
    let name = UserDefaults.standard.string(forKey: "user_first_time")
        if name == nil
        {
            performSegue(withIdentifier: "Onboarding", sender: nil)
            // Do the segue to the onboarding here
        }
        else
        {
            performSegue(withIdentifier: "skipOnboarding", sender: nil)
    }
    //  }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
    
    
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
