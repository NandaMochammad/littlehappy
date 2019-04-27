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
    let feelingArray = [Feeling.anger, Feeling.disgust, Feeling.fear, Feeling.joy, Feeling.sadness]
    var imgArray1: [UIImage] = []
    var imgArray2: [UIImage] = []
    var imgArray3: [UIImage] = []
    var imgArray4: [UIImage] = []
    var imgArray5: [UIImage] = []
    var timer: Timer? {
        didSet {
            self.timer?.fire()
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        let value = UIInterfaceOrientation.lan.rawValue
        
        let flowLayout = UPCarouselFlowLayout()
        
//        UIDevice.current.setValue(value, forKey: "orientation")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 500, height: collectionView.frame.size.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sideItemScale = 0.8
        flowLayout.sideItemAlpha = 1.0
        flowLayout.spacingMode = .fixed(spacing: 20.0)
        
        collectionView.collectionViewLayout = flowLayout
        collectionView.delegate = self
        collectionView.dataSource = self
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BG")!)
        
        loadImages()
        //        print(UIScreen.main.bounds.size.width - 400)
        //        print(collectionView.frame.size.height)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(self.shakeCells), userInfo: nil, repeats: true)
        }
    }
    
    @objc func shakeCells() {
        let movementConstant: CGFloat = 10
        self.collectionView.visibleCells.forEach { (cell) in
            let cell = cell as! CollectionViewCell
            UIView.animate(withDuration: 0.5, delay: 2.4, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                cell.cellImage.frame.origin.y -= movementConstant
            }) { (_) in
                UIView.animate(withDuration: 0.5, animations: {
                    cell.cellImage.frame.origin.y += movementConstant
                })
            }
        }
    }
    
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
//        let image: String = "\(familyArray[indexPath.row].description.lowercased())_happy face"
//        cell.cellImage.image = UIImage(named: image)
        cell.cellLabel.text = " \(familyArray[indexPath.row].description)"
        cell.layer.cornerRadius = 120
        cell.cellButton.tag = indexPath.row
//        print(indexPath.row)
        
        switch indexPath.row {
            
        case 0:
            cell.cellImage.animationImages = imgArray1
            cell.cellImage.image = imgArray1[3]
//            print(imgArray1)
        case 1:
            cell.cellImage.animationImages = imgArray2
            cell.cellImage.image = imgArray2[3]
//            print(imgArray2)
        case 2:
            cell.cellImage.animationImages = imgArray3
            cell.cellImage.image = imgArray3[3]
//            print(imgArray3)
        case 3:
            cell.cellImage.animationImages = imgArray4
            cell.cellImage.image = imgArray4[3]
//            print(imgArray4)
        case 4:
            cell.cellImage.animationImages = imgArray5
            cell.cellImage.image = imgArray5[3]
//            print(imgArray5)
        default: break
            
        }
        cell.cellLabel.layer.masksToBounds = true
        cell.cellLabel.layer.cornerRadius = 18
        cell.cellImage.layer.borderColor = UIColor.gray.cgColor
        cell.cellImage.layer.borderWidth = 2
        cell.cellImage.layer.cornerRadius = 72
        cell.cellImage.animationDuration = 20
        cell.cellImage.startAnimating()
        
//        UIView.animate(withDuration: 0.02, animations: {
////            cell.cellImage.frame.size.height += 20
//            cell.cellImage.frame.origin.y -= 10
//
//        }) {_ in
//            UIView.animateKeyframes(withDuration: 0.02, delay: 0, options: [.autoreverse, .repeat], animations: {
////                cell.cellImage.frame.size.height -= 20
//                cell.cellImage.frame.origin.y += 10
//            }, completion: nil)
//        }
        
//        let timer = Timer(timeInterval: 0.02, repeats: true) { (timer) in
//            print("Timer: \(timer)")
//        }
//        timer.fire()
        
        return cell
    }
    
    @IBAction func cellButton(_ sender: UIButton) {
        
        print("cellButton \(sender.tag)")
        
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
    
    func loadImages() {
        
        // Me
        
        for x in familyArray {
            switch x {
            case Person.me:
                imgArray1.removeAll()
                for y in feelingArray {
                    imgArray1.append(MediaManager.shared.getPhotoAssets(person: x, feeling: y))
                }
            case Person.father:
                imgArray2.removeAll()
                for y in feelingArray {
                    imgArray2.append(MediaManager.shared.getPhotoAssets(person: x, feeling: y))
                }
            case Person.mother:
                imgArray3.removeAll()
                for y in feelingArray {
                    imgArray3.append(MediaManager.shared.getPhotoAssets(person: x, feeling: y))
                }
            case Person.brother:
                imgArray4.removeAll()
                for y in feelingArray {
                    imgArray4.append(MediaManager.shared.getPhotoAssets(person: x, feeling: y))
                }
            case Person.sister:
                imgArray5.removeAll()
                for y in feelingArray {
                    imgArray5.append(MediaManager.shared.getPhotoAssets(person: x, feeling: y))
                }
                
            }
            
        }
        
    }
    
}
/*
extension UINavigationController {
    
    override open var shouldAutorotate: Bool {
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.shouldAutorotate
            }
            return super.shouldAutorotate
        }
    }
    
    override open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.preferredInterfaceOrientationForPresentation
            }
            return super.preferredInterfaceOrientationForPresentation
        }
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.supportedInterfaceOrientations
            }
            return super.supportedInterfaceOrientations
        }
    }
 }
*/
