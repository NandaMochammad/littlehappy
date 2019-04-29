//
//  FamilyViewController.swift
//  familyHappy
//
//  Created by I Putu Krisna on 24/04/19.
//  Copyright © 2019 Kulit Biru YG. All rights reserved.
//

import UIKit

class FamilyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let familyArray = [Person.me, Person.father, Person.mother, Person.brother, Person.sister]
//    let feelingArray = [Feeling.anger, Feeling.disgust, Feeling.fear, Feeling.joy, Feeling.sadness]
//    var imgArray1: [UIImage] = []
//    var imgArray2: [UIImage] = []
//    var imgArray3: [UIImage] = []
//    var imgArray4: [UIImage] = []
//    var imgArray5: [UIImage] = []
//    var timer: Timer? {
//        didSet {
//            self.timer?.fire()
//        }
//    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let flowLayout = UPCarouselFlowLayout()
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 500, height: collectionView.frame.size.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sideItemScale = 0.8
        flowLayout.sideItemAlpha = 1.0
        flowLayout.spacingMode = .fixed(spacing: 50.0)
        
        collectionView.collectionViewLayout = flowLayout
        collectionView.delegate = self
        collectionView.dataSource = self
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BG")!)
        
//        loadImages()
        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//
//        super.viewDidAppear(animated)
//
//        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
//            self.timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.shakeCells), userInfo: nil, repeats: true)
//        }
//
//    }
//
//    @objc func shakeCells() {
//
//        let movementConstant: CGFloat = 10
//
//        self.collectionView.visibleCells.forEach { (cell) in
//            let cell = cell as! CollectionViewCell
//            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
//                cell.cellImage.frame.origin.y -= movementConstant
//            }) { (_) in
//                UIView.animate(withDuration: 0.5, animations: {
//                    cell.cellImage.frame.origin.y += movementConstant
//                })
//            }
//        }
//
//    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        return .landscape
        
    }
    
    override var shouldAutorotate: Bool {
        
        return UIDevice.current.orientation != .portrait
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return familyArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        
        cell.cellLabel.text = familyArray[indexPath.row].description
        cell.layer.cornerRadius = 40
        cell.cellButton.tag = indexPath.row

        if familyArray[indexPath.row] != Person.me {
            if let image = UIImage(named: familyArray[indexPath.row].description.lowercased()) {
                cell.cellImage.image = image
            } else {
                cell.cellImage.image = UIImage(named: "Default-Joy")!
            }
        } else {
            //            print(DataManager.shared.gender)
            if DataManager.shared.gender == .male {
                if let image = UIImage(named: "me boy") {
                    cell.cellImage.image = image
                } else {
                    cell.cellImage.image = UIImage(named: "Default-Joy")!
                }
            } else if DataManager.shared.gender == .female {
                if let image = UIImage(named: "me girl") {
                    cell.cellImage.image = image
                } else {
                    cell.cellImage.image = UIImage(named: "Default-Joy")!
                }
            }
        }
        
        UIView.animate(withDuration: 0, animations: {
            cell.cellImage.frame.origin.y += 10
            
        }){_ in
            UIView.animateKeyframes(withDuration: 1, delay: 0.25, options: [.autoreverse, .repeat], animations: {
                cell.cellImage.frame.origin.y -= 10
                cell.cellImage.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.2)
            }, completion: nil)
        }
        
        return cell
        
    }
    
    @IBAction func cellButton(_ sender: UIButton) {
        
        let person = familyArray[sender.tag]
        
        performSegue(withIdentifier: "PhotosSegue", sender: person)
  
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "PhotosSegue" {
            let vc = segue.destination as! PhotosViewController
            let person = sender as! Person
            vc.currPerson = person
        }
        
    }
    
//    func loadImages() {
//
//        for x in familyArray {
//            switch x {
//            case Person.me:
//                imgArray1.removeAll()
//                for y in feelingArray {
//                    imgArray1.append(MediaManager.shared.getPhotoAssets(person: x, feeling: y))
//                }
//            case Person.father:
//                imgArray2.removeAll()
//                for y in feelingArray {
//                    imgArray2.append(MediaManager.shared.getPhotoAssets(person: x, feeling: y))
//                }
//            case Person.mother:
//                imgArray3.removeAll()
//                for y in feelingArray {
//                    imgArray3.append(MediaManager.shared.getPhotoAssets(person: x, feeling: y))
//                }
//            case Person.brother:
//                imgArray4.removeAll()
//                for y in feelingArray {
//                    imgArray4.append(MediaManager.shared.getPhotoAssets(person: x, feeling: y))
//                }
//            case Person.sister:
//                imgArray5.removeAll()
//                for y in feelingArray {
//                    imgArray5.append(MediaManager.shared.getPhotoAssets(person: x, feeling: y))
//                }
//
//            }
//
//        }
//
//
//    }
    
}

