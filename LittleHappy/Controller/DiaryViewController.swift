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
    
    var feelsDictionary : [String:[String]] = [:]
    
    var kindOfFeels = [String]()
    var dateOfFeels = [String]()
    var timeOfFeels = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Declare the table view to be a delegate for UITableViewDelegate, UITableViewDataSource
        diaryTableView.delegate = self
        diaryTableView.dataSource = self

    }
    
    //SET CELL DIARY
    
    //Method hasil inherit UITableViewDelegate, UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Set custom cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "diaryCustomCell", for: indexPath) as! DiaryCustomTableViewCell
        
        cell.feelDiary.text = kindOfFeels[indexPath.row]
        cell.dateDiary.text = dateOfFeels[indexPath.row]
        cell.timeDiary.text = timeOfFeels[indexPath.row]
        cell.iconDiary.image = UIImage(named: cell.feelDiary.text ?? "Happy")
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kindOfFeels.count
    }
    
    //Configure Table View
    func configureTableView(){
        diaryTableView.rowHeight = UITableView.automaticDimension
        diaryTableView.estimatedRowHeight = 120.0
    }
    
    //GET DATA FROM MODEL
    
    //Method untuk mengambil data dr Model
    func retriveFeel(){
        let userFeelModel = UserFeelModel()
        kindOfFeels = userFeelModel.kindOfFeels
        dateOfFeels = userFeelModel.dateOfFeels
        timeOfFeels = userFeelModel.timeOfFeels
        
        configureTableView()
        diaryTableView.reloadData()
        
    }
    
    
    
}
