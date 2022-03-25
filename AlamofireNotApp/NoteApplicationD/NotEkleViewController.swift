//
//  NotEkleViewController.swift
//  NoteApp
//
//  Created by fatih on 24.02.2022.
//

import UIKit
import Alamofire

class NotEkleViewController: UIViewController {

    @IBOutlet weak var textfieldDersAdi: UITextField!
    @IBOutlet weak var textfieldNot1: UITextField!
    @IBOutlet weak var textfieldNot2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func notEkle(_ sender: Any) {
        if let ad = textfieldDersAdi.text,let not1 = textfieldNot1.text,let not2 = textfieldNot2.text{
            
            if let n1 = Int(not1),let n2 = Int(not2){
                NotEkle(ders_adi: ad, not1: n1, not2: n2)
            }
            
        }
    }
    func NotEkle(ders_adi:String,not1:Int,not2:Int){
        
        let parametreler:Parameters = ["ders_adi":ders_adi,"not1":not1,"not2":not2]
        
        Alamofire.request("http://kasimadalan.pe.hu/notlar/insert_not.php",method: .post,parameters: parametreler).responseJSON{
            response in
            if let data = response.data {
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
