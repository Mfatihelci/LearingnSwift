//
//  KisiEkleViewController.swift
//  KisilerUygulaması
//
//  Created by fatih on 17.02.2022.
//

import UIKit

class KisiEkleViewController: UIViewController {
    @IBOutlet weak var kisiAdTextfield: UITextField!
    
    @IBOutlet weak var kisiTelTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    @IBAction func Ekle(_ sender: Any) {
        
        if let ad = kisiAdTextfield.text,let tel = kisiTelTextfield.text{
            Kisilerdao().kisiEkle(kisi_ad: ad, kisi_tel: tel)
        }
    }

}
