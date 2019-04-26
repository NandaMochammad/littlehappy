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
    var imgArray1boy: [UIImage] = []
    var imgArray1girl: [UIImage] = []
    var imgArray2: [UIImage] = []
    var imgArray3: [UIImage] = []
    var imgArray4: [UIImage] = []
    var imgArray5: [UIImage] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        let value = UIInterfaceOrientation.lan.rawValue
        let flowLayout = UPCarouselFlowLayout()
        
//        UIDevice.current.setValue(value, forKey: "orientation")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 400, height: collectionView.frame.size.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sideItemScale = 0.8
        flowLayout.sideItemAlpha = 1.0
        flowLayout.spacingMode = .fixed(spacing: 20.0)
        
        collectionView.collectionViewLayout = flowLayout
        collectionView.delegate = self
        collectionView.dataSource = self
        
        loadImages()
        //        print(UIScreen.main.bounds.size.width - 400)
        //        print(collectionView.frame.size.height)
        
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
        cell.cellLabel.text = familyArray[indexPath.row].description
        cell.layer.cornerRadius = 120
        cell.cellButton.tag = indexPath.row
        print(indexPath.row)
        
        switch indexPath.row {
            
        case 0:
            if UserDefaults.standard.string(forKey: "gender") == "MALE" {
                cell.cellImage.animationImages = imgArray1boy
                print(imgArray1boy)
            } else if UserDefaults.standard.string(forKey: "gender") == "FEMALE" {
                cell.cellImage.animationImages = imgArray1girl
                print(imgArray1girl)
            }
        case 1:
            cell.cellImage.animationImages = imgArray2
            print(imgArray2)
        case 2:
            cell.cellImage.animationImages = imgArray3
            print(imgArray3)
        case 3:
            cell.cellImage.animationImages = imgArray4
            print(imgArray4)
        case 4:
            cell.cellImage.animationImages = imgArray5
            print(imgArray5)
        default: break
            
        }
        
        cell.cellImage.animationDuration = 2
        cell.cellImage.startAnimating()
        
        UIView.animate(withDuration: 0.2, animations: {
            cell.cellImage.frame.origin.y -= 20
            
        }) {_ in
            UIView.animateKeyframes(withDuration: 0.5, delay: 0.25, options: [.autoreverse, .repeat], animations: {
                cell.cellImage.frame.origin.y += 20
            }, completion: nil)
        } 
        
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
                if UserDefaults.standard.string(forKey: "gender") == "MALE" {
                    imgArray1boy.removeAll()
                    for y in feelingArray {
                        imgArray1boy.append(MediaManager.shared.getPhotoAssets(person: x, feeling: y))
                    }
                } else if UserDefaults.standard.string(forKey: "gender") == "MALE" {
                    imgArray1girl.removeAll()
                    for y in feelingArray {
                        imgArray1girl.append(MediaManager.shared.getPhotoAssets(person: x, feeling: y))
                    }
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
