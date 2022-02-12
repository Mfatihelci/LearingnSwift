//
//  ForecastScreenVC.swift
//  NumberPredictionApp
//
//  Created by fatih on 11.02.2022.
//

import UIKit

class ForecastScreenVC: UIViewController {

    @IBOutlet weak var labelGameRight: UILabel!
    @IBOutlet weak var labelHelp: UILabel!
    @IBOutlet weak var textFieldEnter: UITextField!
    
    var randomNumber:Int?
    var gameRight = 5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomNumber = Int.random(in: 0...100)
        
        print("Random number : \(randomNumber!)")

       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let gelenveri = sender as? Bool {
            
            let gidilecekVC = segue.destination as! ResultScreenVC
            
            gidilecekVC.conclusion = gelenveri
            
            
        }
    }
    
    @IBAction func guessNumber(_ sender: Any) {
        labelHelp.isHidden = false
        gameRight-=1
        
        if let veri = textFieldEnter.text {
            
            if let guess = Int(veri) {
                
                if gameRight != 0 {
                 
                    if guess == randomNumber! {
                        let conclusion = true
                        performSegue(withIdentifier: "guessToconclusion", sender: conclusion)
                        
                    }
                    
                    if guess > randomNumber! {
                        labelHelp.text = "decrease"
                        labelGameRight.text = "Game right : \(gameRight)"
                        
                    }
                    
                    if guess < randomNumber! {
                        labelHelp.text = "increase"
                        labelGameRight.text = "Game right : \(gameRight)"
                        
                    }
                }
                    
                    if (gameRight == 0){
                    let conclusion = false
                    performSegue(withIdentifier: "guessToconclusion", sender: conclusion)
                    
                }
                
                textFieldEnter.text = ""
            
            }
        }
        
    }

}
