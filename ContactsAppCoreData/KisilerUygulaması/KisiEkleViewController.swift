//
//  KisiEkleViewController.swift
//  KisilerUygulaması
//
//  Created by fatih on 17.02.2022.
//

import UIKit

class KisiEkleViewController: UIViewController {
    
    let context = appDelegate.persistentContainer.viewContext
    
    @IBOutlet weak var kisiAdTextfield: UITextField!
    
    @IBOutlet weak var kisiTelTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Ekle(_ sender: Any) {
        
        if let ad = kisiAdTextfield.text, let tel = kisiTelTextfield.text {
        
        let kisi = Kisiler(context: context)
        
        kisi.kisi_ad = ad
        kisi.kisi_tel = tel
            
        appDelegate.saveContext()
        
        }
    }
    
}
