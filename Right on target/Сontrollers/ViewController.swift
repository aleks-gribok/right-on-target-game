//
//  ViewController.swift
//  Right on target
//
//  Created by  Aleksandr on 13.02.2023.
//

import UIKit

class ViewController: UIViewController {

    var summ = 0
    var sumOfRound = 0
    var numberOfRounds = 1
    var numberRandom = 0
    
    //MARK: - Outlets
    @IBOutlet weak var roundsOutlet: UILabel!
    @IBOutlet weak var sliderOutlet: UISlider! {
        didSet{
            sliderOutlet.minimumValue = 1
            sliderOutlet.maximumValue = 50
        }
    }
    @IBOutlet weak var labelRandomOutlet: UILabel!
    @IBOutlet weak var resultLabelOutlet: UILabel!
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set start value slider
        sliderOutlet.value = 25
        
        //set start random number
        generateRandomNumber()
        
    }
    //MARK: - Actions

    @IBAction func buttonCheckAction(_ sender: UIButton) {
        if numberOfRounds < 5 {
            numberOfRounds += 1
            roundsOutlet.text = "Раунд \(numberOfRounds)"
            scoring(Int(sliderOutlet.value))
            summ += sumOfRound
            resultLabelOutlet.text = "Вы набрали \(summ) очков!"
            generateRandomNumber()
        }
        else if numberOfRounds == 5 {
            scoring(Int(sliderOutlet.value))
            summ += sumOfRound
            numberOfRounds = 1
            roundsOutlet.text = "Раунд \(numberOfRounds)"
            resultLabelOutlet.text = "Вы набрали \(summ) очков за всю игру!"
            summ = 0
        }
    }
    
    //MARK: - Functions
    
    //create random number generation function
    private func generateRandomNumber () {
        let number = Int.random(in: 1..<51)
        numberRandom = number
        labelRandomOutlet.text = "\(number)"
    }
    
    //create scoring method
    private func scoring (_ sliderValue: Int) {
        let differenceSum = abs(numberRandom - sliderValue)
        switch differenceSum {
        case 0: sumOfRound = 10
        case 1...2: sumOfRound = 5
        case 3...4: sumOfRound = 3
        case 5: sumOfRound = 1
        default: sumOfRound = 0
        }
    }
    
}

