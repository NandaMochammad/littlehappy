//
//  FamilyViewController.swift
//  familyHappy
//
//  Created by I Putu Krisna on 24/04/19.
//  Copyright © 2019 Kulit Biru YG. All rights reserved.
//

import UIKit

class FamilyVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    let familyArray = [Person.me, Person.father, Person.mother, Person.brother, Person.sister]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        collectionView.register(UINib.init(nibName: "CollectionVC", bundle: nil), forCellWithReuseIdentifier: "collectionCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionVC")
        let flowLayout = UPCarouselFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 400, height: collectionView.frame.size.height)
//        print(UIScreen.main.bounds.size.width - 400)
//        print(collectionView.frame.size.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sideItemScale = 0.8
        flowLayout.sideItemAlpha = 1.0
        flowLayout.spacingMode = .fixed(spacing: 20.0)
        collectionView.collectionViewLayout = flowLayout
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return familyArray.count
    }
    
    //    cell
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionVC
        
        cell.cellImage.image = UIImage(named: familyArray[indexPath.row].description.lowercased())
        cell.cellLabel.text = familyArray[indexPath.row].description
        cell.layer.cornerRadius = 120
        //        cell.cellImage.image =
        
        return cell
        
    }
    
}
