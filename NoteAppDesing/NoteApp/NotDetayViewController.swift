//
//  NotDetayViewController.swift
//  NoteApp
//
//  Created by fatih on 24.02.2022.
//

import UIKit

class NotDetayViewController: UIViewController {

    @IBOutlet weak var textfieldDersAdi: UITextField!
    @IBOutlet weak var textfieldNot1: UITextField!
    @IBOutlet weak var textfieldNot2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func notSil(_ sender: Any) {
        print("sil")
    }
    
    @IBAction func notGuncelle(_ sender: Any) {
        print("güncelle")
    }
    
}
