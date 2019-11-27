//
//  ViewController.swift
//  bulls-eyeUiKit
//
//  Created by pat on 11/23/19.
//  Copyright © 2019 pat. All rights reserved.

//

import UIKit

class ViewController: UIViewController {
    let deductCap = 50;
    let maxPoints = 200;
    var currentValue: Int = 0;
    var targetValue: Int = 0;
    var round: Int = 0;
    var score: Int = 0;
    var earnedPoints = 0;
    var difference: Int = 0;
    @IBOutlet weak var slider: UISlider!;
    @IBOutlet weak var targetLabel: UILabel!;
    @IBOutlet weak var scoreCounterLabel: UILabel!
    @IBOutlet weak var roundCounterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view.
        startNewRound();
        updateLabels();
        sliderDesign()
    }
    
    @IBAction func hitMeAlert(_ sender: Any) {
        userScore();
        var message: String = "Earned points: \(earnedPoints)";
        let title: String;
        if (earnedPoints == maxPoints){
            title = "Hit right in the bulls eye"
        } else if earnedPoints == 100 {
            title = "Almost had it"
        } else if difference >= deductCap {
            title = "You are way off"
            message = "Deducted points: \(earnedPoints)";
        } else {
            title = "Good job"}
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound();
        });
        alert.addAction(action);
        present(alert, animated: true, completion: nil);
        
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = Int(slider.value.rounded());
    }
    @IBAction func startOver(_ sender: Any) {
        let message: String = "Are you sure you want to start over?";
        let alert = UIAlertController(title: "Start Over", message: message, preferredStyle:.actionSheet);
        let startAction = UIAlertAction(title: "Start Over", style: .destructive, handler: { (action:UIAlertAction!) in
            self.resetProgress();
        });
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil);
        alert.addAction(startAction);
        alert.addAction(cancelAction);
        present(alert, animated: true, completion: nil);
        updateLabels();
        
    }
    @IBAction func infoAlert(_ sender: Any) {
        
    }
    @IBAction func aboutAuthor(_ sender: Any) {
    }
    func startNewRound(){
        targetValue = 100//Int.random(in: 1...100);
        currentValue = Int(slider.value.rounded());
        round = round + 1;
        updateLabels();
        
        
    }
    func updateLabels(){
        targetLabel.text = String(targetValue);
        roundCounterLabel.text = String(round);
        scoreCounterLabel.text = String(score);
        
    }
    func userScore (){
        difference = abs(targetValue - currentValue);
        if difference == 0 {
            earnedPoints = maxPoints;
            score = score + earnedPoints;
        }else if difference == 1{
            earnedPoints = 100;
            score = score + earnedPoints
        }
        else if difference >= deductCap {
            if (difference >= score){
                earnedPoints = difference;
                score = 0;
            } else {
                earnedPoints = difference
                score = score - earnedPoints;
            }
        } else {
            earnedPoints = abs(difference - 100);
            score = score + earnedPoints;
        }
        
        
    }
    
    func resetProgress(){
        score = 0;
        round = 0;
        slider.value = 25;
        startNewRound();
    }
    func sliderDesign(){
        let thumbImage = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImage, for: .normal)
    }
}

