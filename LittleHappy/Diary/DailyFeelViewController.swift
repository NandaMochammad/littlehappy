//
//  DailyFeelViewController.swift
//  LittleHappy
//
//  Created by Nanda Mochammad on 18/04/19.
//  Copyright © 2019 littlehappy. All rights reserved.
//

import UIKit

class DailyFeelViewController: UIViewController {
    
    ///////////////////////////
    //Declare Instance Variable
    
    //Menyimpan nilai feeling pada array
    var feels = ["Happy", "Sad", "Angry", "Fear", "Disgust"]
    @IBOutlet weak var viewHappy: UIView!
    @IBOutlet weak var viewSad: UIView!
    @IBOutlet weak var viewAngry: UIView!
    @IBOutlet weak var viewDisgust: UIView!
    @IBOutlet weak var viewFear: UIView!
    
    
    @IBOutlet weak var feelHappy: UIButton!
    @IBOutlet weak var feelSad: UIButton!
    @IBOutlet weak var feelAngry: UIButton!
    @IBOutlet weak var feelFear: UIButton!
    @IBOutlet weak var feelDisgust: UIButton!

    
    //Membuat variabel untuk menyimpan senderTag
    var senderTag : Int = 0
    var gender = DataManager.shared.gender
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Data Saved \n", DataManager.shared.kindOfFeels,"\n",DataManager.shared.dateOfFeels, "\n", DataManager.shared.timeOfFeels)

        setIconFeelButton()
        
        DataManager.shared.loadDataFromUserDefaults()


    }
    
    //MARK: - SET ICON FEEL
    func setIconFeelButton(){
        
        if gender == .male{
            feelHappy.setImage(UIImage(named: "me boy joy.png"), for: .normal)
            feelSad.setImage(UIImage(named: "me boy sadness.png"), for: .normal)
            feelDisgust.setImage(UIImage(named: "me boy disgust.png"), for: .normal)
            feelAngry.setImage(UIImage(named: "me boy anger.png"), for: .normal)
            feelFear.setImage(UIImage(named: "me boy fear.png"), for: .normal)

        }else{
            feelHappy.setImage(UIImage(named: "me girl joy.png"), for: .normal)
            feelSad.setImage(UIImage(named: "me girl sadness.png"), for: .normal)
            feelDisgust.setImage(UIImage(named: "me girl disgust.png"), for: .normal)
            feelAngry.setImage(UIImage(named: "me girl anger.png"), for: .normal)
            feelFear.setImage(UIImage(named: "me girl fear.png"), for: .normal)
        }

        viewHappy.isHidden = true
        viewSad.isHidden = true
        viewAngry.isHidden = true
        viewFear.isHidden = true
        viewDisgust.isHidden = true
    }

    
    //Membuat fungsi untuk menyimpan nilai button dengan "Tag"
    @IBAction func feelButton(_ sender: UIButton) {
        
        senderTag = sender.tag
        
        switch sender.tag {
        case 0:
            viewHappy.layer.cornerRadius = 60
            setFeelData(senderTag)

        case 1:
            viewSad.layer.cornerRadius = 60
            setFeelData(senderTag)

        case 2:
            viewAngry.layer.cornerRadius = 60
            setFeelData(senderTag)

        case 3:
            viewFear.layer.cornerRadius = 60
            setFeelData(senderTag)

        case 4:
            viewDisgust.layer.cornerRadius = 60
            setFeelData(senderTag)

        default:
            print("no tap")
        }
        
        print("Sender Tag Daily : \(senderTag). \(feels[sender.tag])")
        
        performSegue(withIdentifier: "goToHome", sender: self)
        
    }
    
    /////////////////////////////
    
    //Membuat fungsi untuk menyiapkan data feeling
    func setFeelData(_ senderTags: Int){
        
        DataManager.shared.kindOfFeels.append(feels[senderTags])
        DataManager.shared.dateOfFeels.append(getDateTime()[0])
        DataManager.shared.timeOfFeels.append(getDateTime()[1])
        
        DataManager.shared.saveDataToUserDefaults()
        
        print("Data Saved \n", DataManager.shared.kindOfFeels,"\n",DataManager.shared.dateOfFeels, "\n", DataManager.shared.timeOfFeels)

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

extension DailyFeelViewController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    override var shouldAutorotate: Bool {
        return UIDevice.current.orientation != .portrait
    }
}
