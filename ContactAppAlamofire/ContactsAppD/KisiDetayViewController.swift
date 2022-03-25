//
//  KisiDetayViewController.swift
//  ContactsAppD
//
//  Created by fatih on 15.03.2022.
//

import UIKit

class KisiDetayViewController: UIViewController {

    @IBOutlet weak var kisiAdLabel: UILabel!
    @IBOutlet weak var kisiTelLabel: UILabel!
    
    var kisi:Kisiler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = kisi {
            kisiAdLabel.text = k.kisi_ad
            kisiTelLabel.text = k.kisi_tel
        }
    }
}
