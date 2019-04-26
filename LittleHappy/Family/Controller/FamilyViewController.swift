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
    var imgArray1: [UIImage] = []
    var imgArray2: [UIImage] = []
    var imgArray3: [UIImage] = []
    var imgArray4: [UIImage] = []
    var imgArray5: [UIImage] = []
    var me: Person = .me
    var mother: Person = .mother
    var father: Person = .father
    var brother: Person = .brother
    var sister: Person = .sister
    
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
        switch indexPath.row {
        case 0:
            cell.cellImage.animationImages = imgArray1
//            cell.cellImage.animationDuration = 2
        case 1:
            cell.cellImage.animationImages = imgArray1
//            cell.cellImage.animationDuration = 2
        case 2:
            cell.cellImage.animationImages = imgArray2
//            cell.cellImage.animationDuration = 2
        case 3:
            cell.cellImage.animationImages = imgArray3
//            cell.cellImage.animationDuration = 2
        case 4:
            cell.cellImage.animationImages = imgArray4
//            cell.cellImage.animationDuration = 2
        default: break
//            cell.cellImage.animationImages =
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
        
        imgArray1.removeAll()
        imgArray1.append(MediaManager.shared.getPhoto(person: me, feeling: .joy))
        imgArray1.append(MediaManager.shared.getPhoto(person: me, feeling: .sadness))
        imgArray1.append(MediaManager.shared.getPhoto(person: me, feeling: .fear))
        imgArray1.append(MediaManager.shared.getPhoto(person: me, feeling: .disgust))
        imgArray1.append(MediaManager.shared.getPhoto(person: me, feeling: .anger))
//
//        img1.animationImages = imgArray1
//        img1.animationDuration = 2
//
        // Mother
        
        imgArray2.removeAll()
        imgArray2.append(MediaManager.shared.getPhoto(person: mother, feeling: .joy))
        imgArray2.append(MediaManager.shared.getPhoto(person: mother, feeling: .sadness))
        imgArray2.append(MediaManager.shared.getPhoto(person: mother, feeling: .fear))
        imgArray2.append(MediaManager.shared.getPhoto(person: mother, feeling: .disgust))
        imgArray2.append(MediaManager.shared.getPhoto(person: mother, feeling: .anger))

        // Father
        
        imgArray3.removeAll()
        imgArray3.append(MediaManager.shared.getPhoto(person: father, feeling: .joy))
        imgArray3.append(MediaManager.shared.getPhoto(person: father, feeling: .sadness))
        imgArray3.append(MediaManager.shared.getPhoto(person: father, feeling: .fear))
        imgArray3.append(MediaManager.shared.getPhoto(person: father, feeling: .disgust))
        imgArray3.append(MediaManager.shared.getPhoto(person: father, feeling: .anger))
  
        // Brother
        
        imgArray4.removeAll()
        imgArray4.append(MediaManager.shared.getPhoto(person: brother, feeling: .joy))
        imgArray4.append(MediaManager.shared.getPhoto(person: brother, feeling: .sadness))
        imgArray4.append(MediaManager.shared.getPhoto(person: brother, feeling: .fear))
        imgArray4.append(MediaManager.shared.getPhoto(person: brother, feeling: .disgust))
        imgArray4.append(MediaManager.shared.getPhoto(person: brother, feeling: .anger))
     
        // Sister
        
        imgArray5.removeAll()
        imgArray5.append(MediaManager.shared.getPhoto(person: sister, feeling: .joy))
        imgArray5.append(MediaManager.shared.getPhoto(person: sister, feeling: .sadness))
        imgArray5.append(MediaManager.shared.getPhoto(person: sister, feeling: .fear))
        imgArray5.append(MediaManager.shared.getPhoto(person: sister, feeling: .disgust))
        imgArray5.append(MediaManager.shared.getPhoto(person: sister, feeling: .anger))
        
    }
//
//    func startAnimating() {
//
//        img1.startAnimating()
//        img2.startAnimating()
//        img3.startAnimating()
//        img4.startAnimating()
//        img5.startAnimating()
//
//    }
//
//    func stopAnimating() {
//
//        img1.stopAnimating()
//        img2.stopAnimating()
//        img3.stopAnimating()
//        img4.stopAnimating()
//        img5.stopAnimating()
//
//    }
//
    
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
