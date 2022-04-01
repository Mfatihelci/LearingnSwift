//
//  NotEkleViewController.swift
//  NoteApp
//
//  Created by fatih on 24.02.2022.
//

import UIKit
import Firebase

class NotEkleViewController: UIViewController {

    @IBOutlet weak var textfieldDersAdi: UITextField!
    @IBOutlet weak var textfieldNot1: UITextField!
    @IBOutlet weak var textfieldNot2: UITextField!
    
    var ref:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
    }
    

    @IBAction func notEkle(_ sender: Any) {
        if let ad = textfieldDersAdi.text,let not1 = textfieldNot1.text,let not2 = textfieldNot2.text{
            if let n1 = Int(not1),let n2 = Int(not2){
                notEkle(ders_adi: ad, not1: n1, not2: n2)
            }
        }
    }
    func notEkle(ders_adi:String,not1:Int,not2:Int){
        let dict:[String:Any] = ["ders_adi":ders_adi,"not1":not1,"not2":not2]
        
        let newRef = ref.child("notlar").childByAutoId()
        
        newRef.setValue(dict)
        
    }

}
