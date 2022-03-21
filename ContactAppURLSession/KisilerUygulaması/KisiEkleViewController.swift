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

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func Ekle(_ sender: Any) {
        
        if let ad = kisiAdTextfield.text,let tel = kisiTelTextfield.text {
            kisiEkle(kisi_ad: ad, kisi_tel: tel)
    }
        
    }
    
    func kisiEkle(kisi_ad:String,kisi_tel:String){
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php")!)
        
        request.httpMethod = "POST"
        
        let postString = "kisi_ad=\(kisi_ad)&kisi_tel=\(kisi_tel)"
        
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data,response,error in
            if error != nil || data == nil {
                print("hata")
                return
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] {
                    print(json)
                }
                
            } catch  {
                print(error.localizedDescription)
            }
            
        }.resume()
    }

}
