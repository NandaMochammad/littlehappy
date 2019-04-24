//
//  PhotosTestViewController.swift
//  LittleHappy
//
//  Created by Nanda Mochammad on 18/04/19.
//  Copyright © 2019 littlehappy. All rights reserved.
//

import UIKit

class PhotosTestViewController: UIViewController {

    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    var me: Person = .me
    var mother: Person = .mother
    var father: Person = .father
    
    var imgArray1: [UIImage] = []
    var imgArray2: [UIImage] = []
    var imgArray3: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        img1.layer.cornerRadius = 40
        img1.layer.masksToBounds = true
        
        img2.layer.cornerRadius = 40
        img2.layer.masksToBounds = true
        
        img3.layer.cornerRadius = 40
        img3.layer.masksToBounds = true
        
        // Set and save data
//        DataManager.shared.printData()
//        DataManager.shared.name = "Will"
//        DataManager.shared.age = 41
//        DataManager.shared.gender = .male
//        DataManager.shared.initialized = true
//        DataManager.shared.saveDataToUserDefaults()
        
        // Load and print out data
        DataManager.shared.loadDataFromUserDefaults()
        DataManager.shared.printData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadImages()
        startAnimating()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        stopAnimating()
        
    }
    
    func loadImages() {
        
        // Me
        
        imgArray1.removeAll()
        imgArray1.append(MediaManager.shared.getPhoto(person: me, feeling: .joy))
        imgArray1.append(MediaManager.shared.getPhoto(person: me, feeling: .sadness))
        imgArray1.append(MediaManager.shared.getPhoto(person: me, feeling: .fear))
        imgArray1.append(MediaManager.shared.getPhoto(person: me, feeling: .disgust))
        imgArray1.append(MediaManager.shared.getPhoto(person: me, feeling: .anger))
        
        img1.animationImages = imgArray1
        img1.animationDuration = 2
        
        // Mother
        
        imgArray2.removeAll()
        imgArray2.append(MediaManager.shared.getPhoto(person: mother, feeling: .joy))
        imgArray2.append(MediaManager.shared.getPhoto(person: mother, feeling: .sadness))
        imgArray2.append(MediaManager.shared.getPhoto(person: mother, feeling: .fear))
        imgArray2.append(MediaManager.shared.getPhoto(person: mother, feeling: .disgust))
        imgArray2.append(MediaManager.shared.getPhoto(person: mother, feeling: .anger))
        
        img2.animationImages = imgArray2
        img2.animationDuration = 2
        
        // Father
        
        imgArray3.removeAll()
        imgArray3.append(MediaManager.shared.getPhoto(person: father, feeling: .joy))
        imgArray3.append(MediaManager.shared.getPhoto(person: father, feeling: .sadness))
        imgArray3.append(MediaManager.shared.getPhoto(person: father, feeling: .fear))
        imgArray3.append(MediaManager.shared.getPhoto(person: father, feeling: .disgust))
        imgArray3.append(MediaManager.shared.getPhoto(person: father, feeling: .anger))
        
        img3.animationImages = imgArray3
        img3.animationDuration = 2
        
    }
    
    func startAnimating() {
        
        img1.startAnimating()
        img2.startAnimating()
        img3.startAnimating()
        
    }
    
    func stopAnimating() {
        
        img1.stopAnimating()
        img2.stopAnimating()
        img3.stopAnimating()
        
    }
    
    @IBAction func meBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "PhotosSegue", sender: me)
    }
    
    @IBAction func motherBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "PhotosSegue", sender: mother)
    }
    
    @IBAction func fatherBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "PhotosSegue", sender: father)
    }
    
    @IBAction func playGameBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "QuizSegue", sender: nil)
    }
    
    @IBAction func diaryBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "DiarySegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotosSegue" {
            let currPerson = sender as! Person
            let vc = segue.destination as! PhotosViewController
            vc.currPerson = currPerson
        }
    }
    
}

extension PhotosTestViewController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    override var shouldAutorotate: Bool {
        return UIDevice.current.orientation != .portrait
    }
}
