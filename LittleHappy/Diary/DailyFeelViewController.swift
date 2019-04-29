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
    
    @IBOutlet weak var greetingsLabel: UILabel!
    
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
    
    var questionsArray: [Feeling] = [Feeling.joy, Feeling.sadness, Feeling.anger, Feeling.fear, Feeling.disgust]

    
    //Membuat variabel untuk menyimpan senderTag
    var senderTag : Int = 0
    var gender = DataManager.shared.gender
    
    @IBOutlet var viewBG: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Data Saved \n", DataManager.shared.kindOfFeels,"\n",DataManager.shared.dateOfFeels, "\n", DataManager.shared.timeOfFeels)

        setIconFeelButton()
        
        DataManager.shared.loadDataFromUserDefaults()
        
        self.viewBG.backgroundColor = UIColor(patternImage: UIImage(named: "BG.png")!)

        DataManager.shared.loadDataFromUserDefaults()
        var name = DataManager.shared.name
        if name.isEmpty {
            name = "there"
        }
        greetingsLabel.text = "Hello, \(name)!"


    }
    
    //MARK: - SET ICON FEEL
    func setIconFeelButton(){
        
        let feeling = [feelHappy, feelSad, feelAngry, feelFear, feelDisgust]
        let feels = ["Joy", "Sadness", "Anger", "Fear", "Disgust"]
        
        var kelamin = ""
        
        if gender == .male{
            kelamin = "Boy"
            
        }else{
            kelamin = "Girl"
        }
        
        for i in 0 ... feels.count - 1{
            feeling[i]?.setImage(UIImage(named: "me\(kelamin)\(feels[i])"), for: .normal)
            feeling[i]?.layer.cornerRadius = 50
            feeling[i]?.clipsToBounds = true
        }
        

        viewHappy.isHidden = true
        viewSad.isHidden = true
        viewAngry.isHidden = true
        viewFear.isHidden = true
        viewDisgust.isHidden = true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let targetViewController_1 = segue.destination as! Diary_TipsViewController
        targetViewController_1.tipsText = questionsArray[senderTag].tips
    }
    
    
    //Membuat fungsi untuk menyimpan nilai button dengan "Tag"
    @IBAction func feelButton(_ sender: UIButton) {
        
        senderTag = sender.tag
        
        switch sender.tag {
        case 0:
            viewHappy.layer.cornerRadius = 60
            setFeelData(senderTag)
            self.performSegue(withIdentifier: "tips_segue", sender: Any?.self)

        case 1:
            viewSad.layer.cornerRadius = 60
            setFeelData(senderTag)
            self.performSegue(withIdentifier: "tips_segue", sender: Any?.self)

        case 2:
            viewAngry.layer.cornerRadius = 60
            setFeelData(senderTag)
            self.performSegue(withIdentifier: "tips_segue", sender: Any?.self)

        case 3:
            viewFear.layer.cornerRadius = 60
            setFeelData(senderTag)
            self.performSegue(withIdentifier: "tips_segue", sender: Any?.self)


        case 4:
            viewDisgust.layer.cornerRadius = 60
            setFeelData(senderTag)
            self.performSegue(withIdentifier: "tips_segue", sender: Any?.self)

        default:
            print("no tap")
        }
        
        print("Sender Tag Daily : \(senderTag). \(feels[sender.tag])")
                
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
