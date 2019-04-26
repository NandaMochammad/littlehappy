//
//  MediaManager.swift
//  LittleHappy
//
//  Created by William Sjahrial on 19/04/19.
//  Copyright © 2019 littlehappy. All rights reserved.
//

import UIKit

class MediaManager: NSObject {

    static let shared = MediaManager()
    
    private override init(){}
    
    func savePhoto(image: UIImage, person: Person, feeling: Feeling) {
        let imageName = "\(person.description)_\(feeling.description) face"
        print("saving imageName: \(imageName)")        
        saveImageToDisk(image: image, imageName: imageName)
    }
    
    
    func getPhoto(person: Person, feeling: Feeling) -> UIImage {
        let imageName = "\(person.description)_\(feeling.description) face"
        print("imageName: \(imageName)")
        if let image = loadImageFromDisk(imageName: imageName) {
            print("found")
            return image
        } else {
            print("returning default")
            return UIImage(named: "Default-\(feeling.description)")!
        }
    }
    
    func getDirectoryPath() -> String {
        let path = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("LittleHappyPhotos")
        //print("path: \(path)")
        return path
    }
    
    func saveImageToDisk(image: UIImage, imageName: String) {
        let fileManager = FileManager.default
        let path = getDirectoryPath()
        // Make sure the directory exists
        if !fileManager.fileExists(atPath: path) {
            try! fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        }
        let pathUrl = URL(string: path)
        let imagePath = pathUrl!.appendingPathComponent(imageName)
        let urlString: String = imagePath.absoluteString
        let imageData = image.jpegData(compressionQuality: 0.5)
        fileManager.createFile(atPath: urlString as String, contents: imageData, attributes: nil)
    }
    
    func loadImageFromDisk(imageName: String) -> UIImage? {
        let fileManager = FileManager.default
        let path = getDirectoryPath()
        let pathUrl = URL(string: path)
        let imagePath = pathUrl!.appendingPathComponent(imageName)
        let urlString: String = imagePath.absoluteString
        if !fileManager.fileExists(atPath: path) {
            return nil
        }
        let image = UIImage(contentsOfFile: urlString)
        return image
    }
}
