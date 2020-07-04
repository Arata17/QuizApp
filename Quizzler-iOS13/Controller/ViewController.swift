//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Shakhaidar Miras
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!

   
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight{
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: updateUI)
//        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: self, repeats: false)
    }
    
    @objc func updateUI(){
        scoreLabel.text = "Score \(quizBrain.getScore())"
        option1Button.setTitle(quizBrain.getAnswer(0), for: .normal)
        trueButton.setTitle(quizBrain.getAnswer(1), for: .normal)
        falseButton.setTitle(quizBrain.getAnswer(2), for: .normal)
        questionLabel.text = quizBrain.getText()
        progressBar.progress = quizBrain.getProgress()
        option1Button.backgroundColor = UIColor.clear
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

