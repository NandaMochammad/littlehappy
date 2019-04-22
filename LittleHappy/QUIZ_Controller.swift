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
    
    @IBOutlet weak var emotionLabel: UILabel!
    
    @IBOutlet weak var familyLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    //var questionsArray: [String] = ["HAPPY", "SAD", "ANGRY", "FEAR", "DISGUST"]
    
    var questionsArray: [Feeling] = [Feeling.joy, Feeling.sadness, Feeling.anger, Feeling.fear, Feeling.disgust]
    
    var questionNumber = 0
    
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Current Score: \(score)/5"
        questionsArray.shuffle()
        familyLabel.text = "MAMA"
        generateEmotions()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let targetViewController = segue.destination as! Tips_Controller
            targetViewController.tipsText = questionsArray[questionNumber].tips
    }
    
    //This function will generate a random number based on the count of the array
    func generateRandomNumber(array: [Feeling]) ->  Int
    {
        return Int(arc4random_uniform(UInt32(array.count)))
    }
    
//    }
    
    //This function will loop through the emotions and set the result using probability
    func generateEmotions()
    {
        emotionLabel.text = questionsArray[questionNumber].text
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
                    let randomNumberPick = generateRandomNumber(array: probabilityArray)
                    answerArray.append(probabilityArray[randomNumberPick])
                    probabilityArray.remove(at: randomNumberPick)
            }
        }
        answerArray.shuffle()
        emotionChoice1.setTitle(answerArray[0].text, for: .normal)
        emotionChoice2.setTitle(answerArray[1].text, for: .normal)
        emotionChoice3.setTitle(answerArray[2].text, for: .normal)
    }
    
    func buttonChoose()
    {
        if questionNumber < 4
        {
            questionNumber = questionNumber + 1
            generateEmotions()
            scoreLabel.text = "Current Score: \(score)/5"
        }
        else
        {
            scoreLabel.text = "Quiz Finished"
        }
    }
    
    @IBAction func choice1Click(_ sender: UIButton) {
        self.performSegue(withIdentifier: "tips_segue", sender: Any?.self)
        if emotionChoice1.titleLabel?.text == questionsArray[questionNumber].text
        {
            score = score + 1
        }
        buttonChoose()
    }
    
    @IBAction func choice2Click(_ sender: UIButton) {
        self.performSegue(withIdentifier: "tips_segue", sender: Any?.self)
        if emotionChoice2.titleLabel?.text == questionsArray[questionNumber].text
        {
            score = score + 1
        }
        buttonChoose()
    }
    
    @IBAction func choice3Click(_ sender: UIButton) {
        self.performSegue(withIdentifier: "tips_segue", sender: Any?.self)
        if emotionChoice3.titleLabel?.text == questionsArray[questionNumber].text
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

}
