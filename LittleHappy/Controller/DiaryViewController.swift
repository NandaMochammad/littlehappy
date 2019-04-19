//
//  DiaryViewController.swift
//  LittleHappy
//
//  Created by Nanda Mochammad on 18/04/19.
//  Copyright © 2019 littlehappy. All rights reserved.
//

import UIKit

//inherit ke UITableViewDelegate, UITableViewDataSource
class DiaryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var diaryTableView: UITableView!
    
    var diaryKindOfFeels = [String]()
    var diaryDateOfFeels = [String]()
    var diaryTimeOfFeels = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Declare the table view to be a delegate for UITableViewDelegate, UITableViewDataSource
        diaryTableView.delegate = self
        diaryTableView.dataSource = self
        
        //Register your MessageCell.xib file here:
        diaryTableView.register(UINib(nibName: "diaryCustomCell", bundle: nil), forCellReuseIdentifier: "diaryCustomCell")
        
        configureTableView()
        retriveFeelData()

    }
    
    //SET CELL DIARY
    
    //Method hasil inherit UITableViewDelegate, UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Set custom cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "diaryCustomCell", for: indexPath) as! DiaryCustomTableViewCell
        
        cell.feelDiary.text = diaryKindOfFeels[indexPath.row]
        cell.dateDiary.text = diaryDateOfFeels[indexPath.row]
        cell.timeDiary.text = diaryTimeOfFeels[indexPath.row]
        cell.iconDiary.image = UIImage(named: cell.feelDiary.text ?? "Happy")
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaryKindOfFeels.count
    }
    
    //Configure Table View
    func configureTableView(){
        diaryTableView.estimatedRowHeight = 120.0
        diaryTableView.rowHeight = UITableView.automaticDimension
    }
    
    //GET DATA FROM MODEL
    
    //Method untuk mengambil data dr UserDefault
    func retriveFeelData(){
        let defaults = UserDefaults.standard
        
        diaryKindOfFeels = defaults.array(forKey: "SavedFeelsAray") as? [String] ?? [String]()
        diaryDateOfFeels = defaults.array(forKey: "SavedDateArray") as? [String] ?? [String]()
        diaryTimeOfFeels = defaults.array(forKey: "SavedTimeArray") as? [String] ?? [String]()
        
        print(diaryKindOfFeels)
        print(diaryDateOfFeels)
        print(diaryTimeOfFeels)

        configureTableView()
        diaryTableView.reloadData()
        
    }
    
    
    
}
