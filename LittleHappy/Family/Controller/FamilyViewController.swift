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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        let flowLayout = UPCarouselFlowLayout()
        
        UIDevice.current.setValue(value, forKey: "orientation")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 400, height: collectionView.frame.size.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sideItemScale = 0.8
        flowLayout.sideItemAlpha = 1.0
        flowLayout.spacingMode = .fixed(spacing: 20.0)
        
        collectionView.collectionViewLayout = flowLayout
        collectionView.delegate = self
        collectionView.dataSource = self
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
        
        cell.cellImage.image = UIImage(named: familyArray[indexPath.row].description.lowercased())
        cell.cellLabel.text = familyArray[indexPath.row].description
        cell.layer.cornerRadius = 120
        cell.cellButton.tag = indexPath.row
        
        UIView.animate(withDuration: 0.2, animations: {
            cell.cellImage.frame.origin.y -= 20
            //            cell.cellImage.transform = CGAffineTransform.init(rotationAngle: 45)
            
        }){_ in
            UIView.animateKeyframes(withDuration: 0.5, delay: 0.25, options: [.autoreverse, .repeat], animations: {
                cell.cellImage.frame.origin.y += 20
                //                cell.cellImage.transform = CGAffineTransform.init(rotationAngle: -45)
            }, completion: nil)
        }
//        cell.cellImage.layer.add(cell.cellImage.fra, forKey: <#T##String?#>)
        
        return cell
        
    }
    
    @IBAction func cellButton(_ sender: UIButton) {
        
//        print("cellButton \(sender.tag)")
        
        let person = familyArray[sender.tag]
        
        performSegue(withIdentifier: "PhotosSegue", sender: person)
        
        
        
        //        UIView.animate(withDuration: 1, animations: {
        //            cell.cellImage.frame.origin.y -= 20
        //            //            cell.cellImage.transform = CGAffineTransform.init(rotationAngle: 45)
        //
        //        }){_ in
        //            UIView.animateKeyframes(withDuration: 1, delay: 0.25, options: [.autoreverse, .repeat], animations: {
        //                cell.cellImage.frame.origin.y += 20
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "PhotosSegue" {
            
            let vc = segue.destination as! PhotosViewController
            let person = sender as! Person
            vc.currPerson = person
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
