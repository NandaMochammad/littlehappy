
//  MainVC.swift
//  LittleHappy
//
//  Created by I Putu Krisna on 19/04/19.
//  Copyright © 2019 littlehappy. All rights reserved.

import UIKit
import CoreData

class ItemViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var defaults = UserDefaults.standard
    var itemArray = [Item]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        loadItem()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //return The number of rows in section.
        return itemArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //return A configured cell object.
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.cellLabel.text = itemArray[indexPath.row].title
        cell.cellImage.image = UIImage(named: "\(cell.cellLabel.text!.lowercased() )")
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        performSegue(withIdentifier: "categoryToItem", sender: self)
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        let destinationVC = segue.destination as! ItemViewController
//
//        if let indexPath = collectionView.indexPathsForSelectedItems {
//            let index: NSIndexPath = indexPath[0] as NSIndexPath
//            destinationVC.selectedCategory = categoryArray[index.row]
//        }
//
//    }
    
    //MARK - Create New Category
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
        }
        alert.addAction(UIAlertAction(title: "Add Category", style: .default) { (action) in
            let newItem = Item(context: self.context)
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            self.saveItem()
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func saveItem() {
        
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        
        collectionView.reloadData()
        
    }
    
    func loadItem() {
        
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        
        do {
            itemArray = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
        
        collectionView.reloadData()
        
    }
    
}
