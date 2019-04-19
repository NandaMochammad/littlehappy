//
//  ViewController.swift
//  LittleHappy
//
//  Created by Nanda Mochammad on 18/04/19.
//  Copyright © 2019 littlehappy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    
    var currPerson: Person = .me
    var imgArray: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        img.layer.cornerRadius = 40
        img.layer.masksToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        refreshImages()
        
    }
    
    func refreshImages() {
        
        imgArray.removeAll()
        imgArray.append(MediaManager.shared.getPhoto(person: currPerson, feeling: .joy))
        imgArray.append(MediaManager.shared.getPhoto(person: currPerson, feeling: .sadness))
        imgArray.append(MediaManager.shared.getPhoto(person: currPerson, feeling: .fear))
        imgArray.append(MediaManager.shared.getPhoto(person: currPerson, feeling: .disgust))
        imgArray.append(MediaManager.shared.getPhoto(person: currPerson, feeling: .anger))
        
        img.animationImages = imgArray
        img.animationDuration = 2
        img.startAnimating()
        
    }

}

