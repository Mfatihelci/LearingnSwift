//
//  KisiGuncelleViewController.swift
//  ContactsAppD
//
//  Created by fatih on 15.03.2022.
//

import UIKit
import Alamofire

class KisiGuncelleViewController: UIViewController {
    @IBOutlet weak var kisiAdTextfield: UITextField!
    
    @IBOutlet weak var kisiTelTextfield: UITextField!
    
    var kisi:Kisiler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = kisi {
            kisiAdTextfield.text = k.kisi_ad
            kisiTelTextfield.text = k.kisi_tel
        }
    }
    

    @IBAction func Guncelle(_ sender: Any) {
        if let k = kisi,let ad = kisiAdTextfield.text,let tel = kisiTelTextfield.text {
            if let kid = Int(k.kisi_id!){
                kisiGuncelle(kisi_id: kid, kisi_ad: ad, kisi_tel: tel)
            }
        }
    }
    func kisiGuncelle(kisi_id:Int,kisi_ad:String,kisi_tel:String){
        let parametreler:Parameters = ["kisi_id":kisi_id,"kisi_ad":kisi_ad,"kisi_tel":kisi_tel]
        
        Alamofire.request("http://kasimadalan.pe.hu/kisiler/update_kisiler.php",method: .post,parameters: parametreler).responseJSON{
            response in
            if let data = response.data{
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                        print(json)
                    }
                } catch  {
                    print(error.localizedDescription)
                }
            }
        }
    }

}
