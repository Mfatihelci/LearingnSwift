//
//  KisiEkleViewController.swift
//  ContactsAppD
//
//  Created by fatih on 15.03.2022.
//

import UIKit
import Firebase

struct Fatih: Codable {
    let a: String
}

class KisiEkleViewController: UIViewController {

    @IBOutlet weak var kisiAdTextfield: UITextField!
    @IBOutlet weak var kisiTelTextfield: UITextField!
    
    var ref:DatabaseReference!
    lazy var fatih: Fatih = Fatih(a: "a")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
    }
    

    @IBAction func Ekle(_ sender: Any) {
        if let ad = kisiAdTextfield.text,let tel = kisiTelTextfield.text {
            kisiEkle(kisi_ad: ad, kisi_tel: tel)
        }
    }
    
    func kisiEkle(kisi_ad:String,kisi_tel:String) {
        let dict:[String:Any] = ["kisi_id":"","kisi_ad":kisi_ad,"kisi_tel":kisi_tel]
        
        let newRef = ref.child("kisiler").childByAutoId()
        
        newRef.setValue(dict)
    }
}
