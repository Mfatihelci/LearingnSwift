//
//  KelimeDetayViewController.swift
//  DictionaryApp
//
//  Created by fatih on 24.02.2022.
//

import UIKit

class KelimeDetayViewController: UIViewController {
    @IBOutlet weak var ingilizceLabel: UILabel!
    
    @IBOutlet weak var turkceLabel: UILabel!
    
    var kelime:Kelimeler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = kelime {
            ingilizceLabel.text = k.ingilizce
            turkceLabel.text = k.turkce
        }
        
    }
    

    
}
