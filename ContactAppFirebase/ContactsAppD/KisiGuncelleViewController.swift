//
//  KisiGuncelleViewController.swift
//  ContactsAppD
//
//  Created by fatih on 15.03.2022.
//

import UIKit
import Firebase

class KisiGuncelleViewController: UIViewController {
    @IBOutlet weak var kisiAdTextfield: UITextField!
    
    @IBOutlet weak var kisiTelTextfield: UITextField!
    
    var kisi:Kisiler?
    
    var ref:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()

        if let k = kisi {
            kisiAdTextfield.text = k.kisi_ad
            kisiTelTextfield.text = k.kisi_tel
        }
    }
    

    @IBAction func Guncelle(_ sender: Any) {
        if let k = kisi,let ad = kisiAdTextfield.text,let tel = kisiTelTextfield.text {
            kisiGuncelle(kisi_id:k.kisi_id!,kisi_ad:ad,kisi_tel:tel)
        }
    }
    func kisiGuncelle(kisi_id:String,kisi_ad:String,kisi_tel:String) {
        
        ref.child("kisiler").child(kisi_id).updateChildValues(["kisi_ad":kisi_ad,"kisi_tel":kisi_tel])
    }
}
