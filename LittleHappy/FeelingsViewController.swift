//
//  FeelingsViewController.swift
//  LittleHappy
//
//  Created by William Sjahrial on 19/04/19.
//  Copyright © 2019 littlehappy. All rights reserved.
//

import UIKit

class FeelingsViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var currPerson: Person = .me
    var currFeeling: Feeling = .joy
    
    @IBOutlet weak var personLbl: UILabel!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = currPerson.description
        
        personLbl.text = currPerson.description
        
        img1.layer.cornerRadius = 80
        img1.layer.masksToBounds = true
        
        img2.layer.cornerRadius = 80
        img2.layer.masksToBounds = true
        
        img3.layer.cornerRadius = 80
        img3.layer.masksToBounds = true
        
        img4.layer.cornerRadius = 80
        img4.layer.masksToBounds = true
        
        img5.layer.cornerRadius = 80
        img5.layer.masksToBounds = true
        
        refreshPhotos()
        
    }
    
    func refreshPhotos() {
        
        img1.image = MediaManager.shared.getPhoto(person: currPerson, feeling: .joy)
        img2.image = MediaManager.shared.getPhoto(person: currPerson, feeling: .sadness)
        img3.image = MediaManager.shared.getPhoto(person: currPerson, feeling: .fear)
        img4.image = MediaManager.shared.getPhoto(person: currPerson, feeling: .disgust)
        img5.image = MediaManager.shared.getPhoto(person: currPerson, feeling: .anger)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Actions

    @IBAction func btnTapped(_ sender: Any) {
        print(#function)
    
        let btn = sender as! UIButton
        
        if btn == btn1 {
            currFeeling = .joy
        } else if btn == btn2 {
            currFeeling = .sadness
        } else if btn == btn3 {
            currFeeling = .fear
        } else if btn == btn4 {
            currFeeling = .disgust
        } else if btn == btn5 {
            currFeeling = .anger
        }
        
        // Get Photo
        // Tutorial: https://hackernoon.com/swift-access-ios-camera-and-photo-library-dc1dbe0cdd76
        showActionSheet()
    }
    
    func showActionSheet() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (alert:UIAlertAction!) -> Void in
            self.camera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { (alert:UIAlertAction!) -> Void in
            self.photoLibrary()
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true, completion: nil)
    }
    
    func camera()
    {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .camera
            present(myPickerController, animated: true, completion: nil)
        }
        
    }
    
    func photoLibrary()
    {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self;
            myPickerController.sourceType = .photoLibrary
            myPickerController.modalPresentationStyle = .overCurrentContext // for Landscape
            present(myPickerController, animated: true, completion: nil)
        }
    }
    
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(#function)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            print("We have an image!")
            
            // Save to Documents directory
            // Tutorial: https://medium.com/@vikaskore/save-get-and-delete-multiple-images-from-document-directory-in-swift-db75e536b72b
            MediaManager.shared.savePhoto(image: image, person: currPerson, feeling: currFeeling)
            refreshPhotos()
            
        }else{
            print("Something went wrong...")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print(#function)
        self.dismiss(animated: true, completion: nil)
    }
    
}
