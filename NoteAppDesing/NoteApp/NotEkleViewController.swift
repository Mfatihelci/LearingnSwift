//
//  NotEkleViewController.swift
//  NoteApp
//
//  Created by fatih on 24.02.2022.
//

import UIKit

class NotEkleViewController: UIViewController {

    @IBOutlet weak var textfieldDersAdi: UITextField!
    @IBOutlet weak var textfieldNot1: UITextField!
    @IBOutlet weak var textfieldNot2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func notEkle(_ sender: Any) {
        print("ekle")
    }
    

}
