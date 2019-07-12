//
//  FamilyViewController.swift
//  familyHappy
//
//  Created by I Putu Krisna on 24/04/19.
//  Copyright © 2019 Kulit Biru YG. All rights reserved.
//

import UIKit
import AVFoundation

class FamilyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var audioPlayer: AVAudioPlayer?
    let familyArray = [Person.me, Person.father, Person.mother, Person.brother, Person.sister]
    
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
    
    override func viewDidAppear(_ animated: Bool) {

        super.viewDidAppear(animated)

        collectionView.reloadData()

    }
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
        
        UIView.animate(withDuration: 2, animations: {
            cell.cellImage.frame.origin.y -= 10
            cell.cellImage.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.2)
            
        }){_ in
            UIView.animateKeyframes(withDuration: 1, delay: 0.25, options: [.autoreverse, .repeat], animations: {
                cell.cellImage.frame.origin.y += 10
//                cell.cellImage.frame.origin.y -= 10
//                cell.cellImage.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.2)
            }, completion: nil)
        }
        
        return cell
        
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        playSound()
        performSegue(withIdentifier: "QuizSegue", sender: self)
    }
    
    @IBAction func diaryButton(_ sender: UIButton) {
        playSound()
        performSegue(withIdentifier: "DiarySegue", sender: self)
    }
    
    
    @IBAction func cellButton(_ sender: UIButton) {
        
        let person = familyArray[sender.tag]
        playSound()
        performSegue(withIdentifier: "PhotosSegue", sender: person)
  
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "PhotosSegue" {
            let vc = segue.destination as! PhotosViewController
            let person = sender as! Person
            vc.currPerson = person
        }
        
    }
    
    func playSound() {
        if audioPlayer == nil {
            guard let url = Bundle.main.url(forResource: "button-down",
                                            withExtension: "mp3") else { return }
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.prepareToPlay()
            } catch let error {
                print(error.localizedDescription)
            }
        }
        audioPlayer?.stop()
        audioPlayer?.play()
    }
    
}

