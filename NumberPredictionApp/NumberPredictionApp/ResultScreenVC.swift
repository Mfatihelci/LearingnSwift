//
//  ResultScreenVC.swift
//  NumberPredictionApp
//
//  Created by fatih on 11.02.2022.
//

import UIKit

class ResultScreenVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelConclusion: UILabel!
    
    var conclusion:Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true
        
        self.navigationItem.title = "Result Screen"
        
        print(conclusion!)
        
        if conclusion! {
            labelConclusion.text = "You win"
            imageView.image = UIImage(named: "mutlu")
        }else{
            labelConclusion.text = "You lost"
            imageView.image = UIImage(named: "üzgün")
            
            
        }
        
        
    }
    @IBAction func playAgain(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
    }
    
}
