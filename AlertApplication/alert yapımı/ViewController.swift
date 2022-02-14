//
//  ViewController.swift
//  alert yapımı
//
//  Created by fatih on 1.02.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelSonuc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func basitAlertGoster(_ sender: Any) {
        
        let alertController = UIAlertController(title: "başlık", message: "mesaj", preferredStyle: .alert)
        
        let iptalAction = UIAlertAction(title: "iptal", style: .cancel){ action in
            
            print("iptal tıklandı")
        }
        
        alertController.addAction(iptalAction)
        
        let tamamAction = UIAlertAction(title: "tamam", style: .destructive){ action in
            
            print("tamam tıklandı")
        }
        
        alertController.addAction(tamamAction)
        
        self.present(alertController,animated: true)
        
    }
    
    @IBAction func ozelAlertGoster(_ sender: Any) {
        
        
        let alertController = UIAlertController(title: "başlık", message: "mesaj", preferredStyle: .alert)
        
        
        alertController.addTextField { textfield in
            textfield.placeholder = "email"
            textfield.keyboardType = .emailAddress
        }
        
        alertController.addTextField { textfield in
            textfield.placeholder = "sifre"
            textfield.isSecureTextEntry = true
        }
        
        let kaydetAction = UIAlertAction(title: "kaydet", style: .destructive){ action in
            
            print("kaydet tıklandı")
            
            let alinanEmail = (alertController.textFields![0] as UITextField).text!
            
            let alinanSifre = (alertController.textFields![1] as UITextField).text!
          
            self.labelSonuc.text = "email : \(alinanEmail) sfire: \(alinanSifre)"
            
        }
        
        
        alertController.addAction(kaydetAction)
        
        self.present(alertController,animated: true)
        
    }
    @IBAction func ActionSheet(_ sender: Any) {
        let alertController = UIAlertController(title: "başlık", message: "mesaj", preferredStyle: .actionSheet)
        
        let iptalAction = UIAlertAction(title: "iptal", style: .cancel){ action in
            
            print("action sheet tıklandı")
        }
        
        alertController.addAction(iptalAction)
        
        let tamamAction = UIAlertAction(title: "tamam", style: .destructive){ action in
            
            print("action sheet tıklandı")
        }
        
        alertController.addAction(tamamAction)
        
        self.present(alertController,animated: true)
    }
    
}

