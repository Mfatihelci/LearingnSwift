//
//  NotDetayViewController.swift
//  NoteApp
//
//  Created by fatih on 24.02.2022.
//

import UIKit
import Firebase

class NotDetayViewController: UIViewController {

    @IBOutlet weak var textfieldDersAdi: UITextField!
    @IBOutlet weak var textfieldNot1: UITextField!
    @IBOutlet weak var textfieldNot2: UITextField!
    
    var not:Notlar?
    var ref:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let n = not {
            textfieldDersAdi.text = n.ders_adi
            textfieldNot1.text = String(n.not1!)
            textfieldNot2.text = String(n.not2!)
        }
        
        ref = Database.database().reference()
    }
    
    @IBAction func notSil(_ sender: Any) {
        if let n = not {
            notSil(not_id: n.not_id!)
        }
    }
    
    @IBAction func notGuncelle(_ sender: Any) {
        if let n = not,let ad = textfieldDersAdi.text,let not1 = textfieldNot1.text,let not2 = textfieldNot2.text{
            if let n1 = Int(not1),let n2 = Int(not2){
                notGuncelle(not_id: n.not_id!, ders_adi: ad, not1: n1, not2: n2)
            }
        }

    }
    func notSil(not_id:String){
        
        ref.child("notlar").child(not_id).removeValue()
        
    }
    func notGuncelle(not_id:String,ders_adi:String,not1:Int,not2:Int){
        
        ref.child("notlar").child(not_id).updateChildValues(["ders_adi":ders_adi,"not1":not1,"not2":not2])
        
        
    }
}
