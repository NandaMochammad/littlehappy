//
//  QUIZ_Controller.swift
//  LittleHappy
//
//  Created by Kevin Abram on 22/04/19.
//  Copyright © 2019 littlehappy. All rights reserved.
//

import UIKit

class QUIZ_Controller: UIViewController {
    
    @IBOutlet weak var emotionChoice1: UIButton!
    
    @IBOutlet weak var emotionChoice2: UIButton!
    
    @IBOutlet weak var emotionChoice3: UIButton!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var familyArray: [Person] = [Person.me, Person.father, Person.mother, Person.brother, Person.sister]
    
    var questionsArray: [Feeling] = [Feeling.joy, Feeling.sadness, Feeling.anger, Feeling.fear, Feeling.disgust]
    
    var answerChoiceArray: [Feeling] = [Feeling.joy, Feeling.joy, Feeling.joy]
    
    var questionNumber = 0
    
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        questionNumber = 0
        score = 0
        
        scoreLabel.text = "Current Score: \(score)/5"
        questionsArray.shuffle()
        
        generateEmotions()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if questionNumber < 4
        {
            let targetViewController_1 = segue.destination as! Tips_Controller
            targetViewController_1.tipsText = questionsArray[questionNumber].tips
        }
        else
        {
            let targetViewController_2 = segue.destination as! Score_Controller
            
            switch score
            {
            case 1:
                targetViewController_2.firstImage = UIImage(named: "Star-Filled.png")!
                targetViewController_2.secondImage = UIImage(named: "Star-Unfilled.png")!
                targetViewController_2.thirdImage = UIImage(named: "Star-Unfilled.png")!
                targetViewController_2.fourthImage = UIImage(named: "Star-Unfilled.png")!
                targetViewController_2.fifthImage = UIImage(named: "Star-Unfilled.png")!
            case 2:
                targetViewController_2.firstImage = UIImage(named: "Star-Filled.png")!
                targetViewController_2.secondImage = UIImage(named: "Star-Filled.png")!
                targetViewController_2.thirdImage = UIImage(named: "Star-Unfilled.png")!
                targetViewController_2.fourthImage = UIImage(named: "Star-Unfilled.png")!
                targetViewController_2.fifthImage = UIImage(named: "Star-Unfilled.png")!
            case 3:
                targetViewController_2.firstImage = UIImage(named: "Star-Filled.png")!
                targetViewController_2.secondImage = UIImage(named: "Star-Filled.png")!
                targetViewController_2.thirdImage = UIImage(named: "Star-Filled.png")!
                targetViewController_2.fourthImage = UIImage(named: "Star-Unfilled.png")!
                targetViewController_2.fifthImage = UIImage(named: "Star-Unfilled.png")!
            case 4:
                targetViewController_2.firstImage = UIImage(named: "Star-Filled.png")!
                targetViewController_2.secondImage = UIImage(named: "Star-Filled.png")!
                targetViewController_2.thirdImage = UIImage(named: "Star-Filled.png")!
                targetViewController_2.fourthImage = UIImage(named: "Star-Filled.png")!
                targetViewController_2.fifthImage = UIImage(named: "Star-Unfilled.png")!
            case 5:
                targetViewController_2.firstImage = UIImage(named: "Star-Filled.png")!
                targetViewController_2.secondImage = UIImage(named: "Star-Filled.png")!
                targetViewController_2.thirdImage = UIImage(named: "Star-Filled.png")!
                targetViewController_2.fourthImage = UIImage(named: "Star-Filled.png")!
                targetViewController_2.fifthImage = UIImage(named: "Star-Filled.png")!
            default:
                targetViewController_2.firstImage = UIImage(named: "Star-Unfilled.png")!
                targetViewController_2.secondImage = UIImage(named: "Star-Unfilled.png")!
                targetViewController_2.thirdImage = UIImage(named: "Star-Unfilled.png")!
                targetViewController_2.fourthImage = UIImage(named: "Star-Unfilled.png")!
                targetViewController_2.fifthImage = UIImage(named: "Star-Unfilled.png")!
            }
        }
    }
    
    //This function will generate a random number based on the count of the array
    func generateRandomNumber(array: [Feeling]) ->  Int
    {
        return Int(arc4random_uniform(UInt32(array.count)))
    }
    
    func generateRandomNumber(array: [Person]) -> Int
    {
        return Int(arc4random_uniform(UInt32(array.count)))
    }
    
    //This function will loop through the emotions and set the result using probability
    func generateEmotions()
    {
        let randomNumberPick_1 = generateRandomNumber(array: familyArray)
       // familyLabel.text = familyArray[randomNumberPick_1].text
        
       // emotionLabel.text = questionsArray[questionNumber].text
        
        let personChosen = familyArray[randomNumberPick_1].text
        
        let emotionQuestion = questionsArray[questionNumber].text
        
        var verbToBe: String
        
        if personChosen == "I"
        {
            verbToBe = "'M  "
        }
        else
        {
            verbToBe = "  IS  "
        }
        
        questionLabel.text = personChosen + verbToBe + emotionQuestion
        
        var probabilityArray = questionsArray
        var answerArray: [Feeling] = []
        
        for numberCount in 0...2
        {
            switch numberCount
            {
                case 0:
                    answerArray.append(questionsArray[questionNumber])
                    probabilityArray.remove(at: questionNumber)
                default:
                    let randomNumberPick_2 = generateRandomNumber(array: probabilityArray)
                    answerArray.append(probabilityArray[randomNumberPick_2])
                    probabilityArray.remove(at: randomNumberPick_2)
            }
        }
        
        answerArray.shuffle()
        
        emotionChoice1.setTitle(answerArray[0].text, for: .normal)
        emotionChoice2.setTitle(answerArray[1].text, for: .normal)
        emotionChoice3.setTitle(answerArray[2].text, for: .normal)
        
       // emotionChoice1.setImage(MediaManager.shared.getPhoto(person: familyArray[randomNumberPick_1], feeling: answerArray[0]), for: .normal)
     //   emotionChoice2.setImage(MediaManager.shared.getPhoto(person: familyArray[randomNumberPick_1], feeling: answerArray[1]), for: .normal)
    //    emotionChoice3.setImage(MediaManager.shared.getPhoto(person: familyArray[randomNumberPick_1], feeling: answerArray[2]), for: .normal)
        
        answerChoiceArray[0] = answerArray[0]
        answerChoiceArray[1] = answerArray[1]
        answerChoiceArray[2] = answerArray[2]
    }
    
    func buttonChoose()
    {
        if questionNumber < 4
        {
            self.performSegue(withIdentifier: "tips_segue", sender: Any?.self)
            questionNumber = questionNumber + 1
            generateEmotions()
            scoreLabel.text = "Current Score: \(score)/5"
        }
        else
        {
            self.performSegue(withIdentifier: "score_segue", sender: Any?.self)
           // scoreLabel.text = "Quiz Finished"
        }
    }
    
    @IBAction func choice1Click(_ sender: UIButton) {
        if answerChoiceArray[0].text == questionsArray[questionNumber].text
        {
            score = score + 1
        }
        buttonChoose()
    }
    
    @IBAction func choice2Click(_ sender: UIButton) {

        if answerChoiceArray[1].text == questionsArray[questionNumber].text
        {
            score = score + 1
        }
        buttonChoose()
    }
    
    @IBAction func choice3Click(_ sender: UIButton) {
        if answerChoiceArray[2].text == questionsArray[questionNumber].text
        {
            score = score + 1
        }
        
        buttonChoose()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func quitBtnTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
