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
    
//    @IBOutlet weak var dateOfFeels: UILabel!
    
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
    
    var totalSection : Int = 1
    var arrayOfIndex : [Int] = [0]
    var dateFeelsArray : [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load Data from Data ManagerUserDefaults
        DataManager.shared.loadDataFromUserDefaults()
        
        //Declare the table view to be a delegate for UITableViewDelegate, UITableViewDataSource
        diaryTableView.delegate = self
        diaryTableView.dataSource = self
        
        //Register MessageCell.xib file here:
        diaryTableView.register(UINib(nibName: "diaryCustomCell", bundle: nil), forCellReuseIdentifier: "diaryCustomCell")
        
        sectionConfig()
        feelingPercentage()
    }
    
    //MARK: - SET SECTION
    //Set Section Config
    func sectionConfig(){
        //set Reversed array, Latest to Oldest
        dateFeelsArray = DataManager.shared.dateOfFeels.reversed()
        
        //Loop for define the section changed location
        for j in 1 ... dateFeelsArray.count - 1{
            if dateFeelsArray[j] != dateFeelsArray[j-1]{
                arrayOfIndex.append(j)
                totalSection += 1
            }//if
        }//for
    }//func
    
    
    //MARK: - SET CELL
    //Declare cellForRowAt Content Based on Section
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let diaryKindOfFeels : [String] = DataManager.shared.kindOfFeels.reversed()
        let diaryDateOfFeels : [String] = DataManager.shared.dateOfFeels.reversed()
        let diaryTimeOfFeels : [String] = DataManager.shared.timeOfFeels.reversed()
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "diaryCustomCell", for: indexPath) as! DiaryCustomTableViewCell

            cell.feelDiary.text = diaryKindOfFeels[indexPath.row+arrayOfIndex[indexPath.section]]
            cell.dateDiary.text = diaryDateOfFeels[indexPath.row+arrayOfIndex[indexPath.section]]
            cell.timeDiary.text = diaryTimeOfFeels[indexPath.row+arrayOfIndex[indexPath.section]]
            cell.iconDiary.image = UIImage(named: cell.feelDiary.text ?? "Happy")

            print("section ",indexPath.section)

            return cell
    }//func
    
    //Declare numberOfRowsInSection -> What Index will be shown
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section != totalSection - 1{
            print("numSection \(section)",arrayOfIndex [section+1] - arrayOfIndex[section])
            return arrayOfIndex [section+1] - arrayOfIndex[section]
        }else{
            print("numSection \(section)",dateFeelsArray.count-arrayOfIndex[section])
            return dateFeelsArray.count-arrayOfIndex[section]
        }//else
    }//func
    
    //Declare numberOfSection Based on total section
    func numberOfSections(in tableView: UITableView) -> Int {
        return totalSection
    }//func
    
    //Declare titleForHeaderInSection
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dateFeelsArray[arrayOfIndex[section]]
    }//func
    
    //Give an Action when button tapped -> Fade To White
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    //Configure Table View
    func configureTableView(){
        diaryTableView.estimatedRowHeight = 120.0
        diaryTableView.rowHeight = UITableView.automaticDimension

    }
    
    
    //MARK: - SET PERCENTAGE
    func feelingPercentage(){
        var feelingTotal : [Double] = [0,0,0,0,0]
        let total : Double = Double(DataManager.shared.kindOfFeels.count)
        let views : [UIView] = [vHappy, vSad, vAngry, vFear, vDisgust]
        let icons : [UIImageView] = [happyIcon, sadIcon, angryIcon, fearIcon, disgustIcon]
        
        let feels = DataManager.shared.kindOfFeels
        
        //Get Value each feel
        for i in feels {
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
        
        //Get percentage each feel
        for i in 0 ... feelingTotal.count - 1{
            feelingTotal[i] = feelingTotal[i] / total * 100
            feelingTotal[i] = feelingTotal[i].rounded(.up)
          }
        
        happyPercentage.text = "\(Int(feelingTotal[0]))%"
        sadPercentage.text = "\(Int(feelingTotal[1]))%"
        angryPercentage.text = "\(Int(feelingTotal[2]))%"
        fearPercentage.text = "\(Int(feelingTotal[3]))%"
        disgustPercentage.text = "\(Int(feelingTotal[4]))%"
        
        //Set Size Each Feels
        for i in 0 ... views.count - 1{
            if feelingTotal[i] != 0{
            icons[i].bounds.size = CGSize(width: feelingTotal[i]*2+10, height: feelingTotal[i]*2+10)
            }//else
        }//For
    }//Func
    
    
}//Class

