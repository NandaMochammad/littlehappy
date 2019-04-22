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
    
    //Declare Feeling Percentage
    
    @IBOutlet weak var dateOfFeels: UILabel!
    
    @IBOutlet weak var vHappy: UIView!
    @IBOutlet weak var vSad: UIView!
    @IBOutlet weak var vAngry: UIView!
    @IBOutlet weak var vFear: UIView!
    @IBOutlet weak var vDisgust: UIView!
    
    
    @IBOutlet weak var happyIcon: UIImageView!
    @IBOutlet weak var happyPercentage: UILabel!
    @IBOutlet weak var sadIcon: UIImageView!
    @IBOutlet weak var sadPercentage: UILabel!
    @IBOutlet weak var angryIcon: UIImageView!
    @IBOutlet weak var angryPercentage: UILabel!
    @IBOutlet weak var fearIcon: UIImageView!
    @IBOutlet weak var fearPercentage: UILabel!
    @IBOutlet weak var disgustIcon: UIImageView!
    @IBOutlet weak var disgustPercentage: UILabel!
    
    
    @IBOutlet var diaryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        diaryTableView.reloadData()
        
        //Get Data from UserDefaults
        //Membuat User Default untuk menyimpan data array
        
        DataManager.shared.loadDataFromUserDefaults()
        
        //Declare the table view to be a delegate for UITableViewDelegate, UITableViewDataSource
        diaryTableView.delegate = self
        diaryTableView.dataSource = self
        
        //Register your MessageCell.xib file here:
        diaryTableView.register(UINib(nibName: "diaryCustomCell", bundle: nil), forCellReuseIdentifier: "diaryCustomCell")
        
        
        feelingPercentage()
    }
    
    //SET CELL DIARY
    //Method hasil inherit UITableViewDelegate, UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let diaryKindOfFeels : [String] = DataManager.shared.kindOfFeels.reversed()
        let diaryDateOfFeels : [String] = DataManager.shared.dateOfFeels.reversed()
        let diaryTimeOfFeels : [String] = DataManager.shared.timeOfFeels.reversed()
        
//        var bc : String = diaryDateOfFeels[0]
        
//        if diaryDateOfFeels[indexPath.row] == bc{
            let cell = tableView.dequeueReusableCell(withIdentifier: "diaryCustomCell", for: indexPath) as! DiaryCustomTableViewCell
            
            cell.feelDiary.text = diaryKindOfFeels[indexPath.row]
            cell.dateDiary.text = diaryDateOfFeels[indexPath.row]
            cell.timeDiary.text = diaryTimeOfFeels[indexPath.row]
            cell.iconDiary.image = UIImage(named: cell.feelDiary.text ?? "Happy")
        
//        var newView = UIView(frame: CGRectMake(200, 10, 100, 50))
//        cell.contentView.addSubview(newView)
        
            return cell

//        }
//            else{
//            diaryTableView.register(UINib(nibName: "dateCustomCell", bundle: nil), forCellReuseIdentifier: "dateCustomCell")
//
//            let cell = tableView.dequeueReusableCell(withIdentifier: "dateCustomCell", for: indexPath) as! DateCustomTableViewCell
//            cell.dateLabel.text = diaryDateOfFeels[indexPath.row]
//
//            bc = diaryDateOfFeels[indexPath.row]
//
//            return cell
//        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.kindOfFeels.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Give an Action when button tapped
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    //Configure Table View
    func configureTableView(){
        diaryTableView.estimatedRowHeight = 120.0
        diaryTableView.rowHeight = UITableView.automaticDimension

    }

    
    //Set Feeling Percentage
    func feelingPercentage(){
        var feelingTotal : [Double] = [0,0,0,0,0]
        let total : Double = Double(DataManager.shared.kindOfFeels.count)
        let views : [UIView] = [vHappy, vSad, vAngry, vFear, vDisgust]
        let icons : [UIImageView] = [happyIcon, sadIcon, angryIcon, fearIcon, disgustIcon]
        
        let a = DataManager.shared.kindOfFeels
        
        for i in a {
            if i == "Happy"{
                feelingTotal[0] += 1
            }else if i == "Sad"{
                feelingTotal[1] += 1
            }else if i == "Angry"{
                feelingTotal[2] += 1
            }else if i == "Fear"{
                feelingTotal[3] += 1
            }else{
                feelingTotal[4] += 1
            }
        }
        
        for i in 0 ... feelingTotal.count - 1{
            feelingTotal[i] = feelingTotal[i] / total * 100
            feelingTotal[i] = feelingTotal[i].rounded(.up)
          }
        
        happyPercentage.text = "\(Int(feelingTotal[0]))%"
        sadPercentage.text = "\(Int(feelingTotal[1]))%"
        angryPercentage.text = "\(Int(feelingTotal[2]))%"
        fearPercentage.text = "\(Int(feelingTotal[3]))%"
        disgustPercentage.text = "\(Int(feelingTotal[4]))%"
        
        print(feelingTotal)
        
        for i in 0 ... views.count - 1{
            if feelingTotal[i] != 0{
            icons[i].bounds.size = CGSize(width: feelingTotal[i]*2+10, height: feelingTotal[i]*2+10)
            }else{
                icons[i].bounds.size = CGSize(width: 30, height: 30)
            }//Else
        }//For
    }//Func
}//Class

