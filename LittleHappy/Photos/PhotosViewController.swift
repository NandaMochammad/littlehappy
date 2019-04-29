//
//  PhotosViewController.swift
//  LittleHappy
//
//  Created by William Sjahrial on 19/04/19.
//  Copyright © 2019 littlehappy. All rights reserved.
//

import UIKit
import AVFoundation

class PhotosViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var currPerson: Person = .me
    var currFeeling: Feeling = .joy
    
    var audioPlayer: AVAudioPlayer?
    
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
    
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    @IBOutlet weak var lbl5: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = currPerson.text
        
        var personText = currPerson.text.lowercased()
        if currPerson == .me {
            personText = "you"
        }
        personLbl.text = "Let's take photos for \(personText)!"
        
        img1.layer.cornerRadius = 60
        img1.layer.masksToBounds = true

        img2.layer.cornerRadius = 60
        img2.layer.masksToBounds = true

        img3.layer.cornerRadius = 60
        img3.layer.masksToBounds = true

        img4.layer.cornerRadius = 60
        img4.layer.masksToBounds = true

        img5.layer.cornerRadius = 60
        img5.layer.masksToBounds = true

        
        refreshPhotos()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //startAnimations()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopAnimations()
    }
    
    func refreshPhotos() {
                
        img1.image = MediaManager.shared.getPhoto(person: currPerson, feeling: .joy)
        img2.image = MediaManager.shared.getPhoto(person: currPerson, feeling: .sadness)
        img3.image = MediaManager.shared.getPhoto(person: currPerson, feeling: .fear)
        img4.image = MediaManager.shared.getPhoto(person: currPerson, feeling: .disgust)
        img5.image = MediaManager.shared.getPhoto(person: currPerson, feeling: .anger)
        
    }

    func startAnimations() {
        
        let joyAnim = CABasicAnimation(keyPath: "transform.scale")
        joyAnim.fromValue = 0.9
        joyAnim.toValue = 1.1
        joyAnim.duration = 0.2
        joyAnim.autoreverses = true
        joyAnim.repeatCount = .greatestFiniteMagnitude
        joyAnim.isRemovedOnCompletion = false
        img1.layer.add(joyAnim, forKey: "joy")
        
        let sadnessAnim = CABasicAnimation(keyPath: "transform.translation.y")
        sadnessAnim.fromValue = 0
        sadnessAnim.toValue = 20
        sadnessAnim.duration = 1.0
        sadnessAnim.repeatCount = .greatestFiniteMagnitude
        sadnessAnim.isRemovedOnCompletion = false
        img2.layer.add(sadnessAnim, forKey: "sadness")
        
        let fearAnim = CABasicAnimation(keyPath: "opacity")
        fearAnim.fromValue = 0.8
        fearAnim.toValue = 0.5
        fearAnim.duration = 0.2
        fearAnim.autoreverses = true
        fearAnim.repeatCount = .greatestFiniteMagnitude
        fearAnim.isRemovedOnCompletion = false
        img3.layer.add(fearAnim, forKey: "fear")
        
        let disgustAnim = CABasicAnimation(keyPath: "transform.rotation")
        disgustAnim.toValue = Double.pi
        disgustAnim.isCumulative = true
        disgustAnim.duration = 1.0
        disgustAnim.repeatCount = .greatestFiniteMagnitude
        disgustAnim.isRemovedOnCompletion = false
        img4.layer.add(disgustAnim, forKey: "disgust")
        
        let angerAnim = CABasicAnimation(keyPath: "transform.translation.x")
        angerAnim.fromValue = -5
        angerAnim.toValue = 5
        angerAnim.duration = 0.1
        angerAnim.autoreverses = true
        angerAnim.repeatCount = .greatestFiniteMagnitude
        angerAnim.isRemovedOnCompletion = false
        img5.layer.add(angerAnim, forKey: "anger")
        
    }
    
    func stopAnimations() {
        img1.layer.removeAllAnimations()
        img2.layer.removeAllAnimations()
        img3.layer.removeAllAnimations()
        img4.layer.removeAllAnimations()
        img5.layer.removeAllAnimations()
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

    
    @IBAction func backBtnTapped(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnTapped(_ sender: Any) {
        print(#function)
    
        playSound()
        stopAnimations()
        
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
        //showActionSheet()
        camera()
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
        } else {
            photoLibrary()
        }
        
    }
    
    func photoLibrary()
    {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self;
            myPickerController.sourceType = .photoLibrary
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
    
    // MARK: - Sound Effects
    
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

// Force Landscape only, for Camera purposes
// The app supports Portrait in Info.plist, but we programmatically force it to be landscape only
// https://stackoverflow.com/questions/27037839/force-landscape-mode-in-one-viewcontroller-using-swift

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

extension PhotosViewController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    override var shouldAutorotate: Bool {
        return UIDevice.current.orientation != .portrait
    }
}

extension UIImagePickerController {
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    open override var shouldAutorotate: Bool {
        return UIDevice.current.orientation != .portrait
    }
}

