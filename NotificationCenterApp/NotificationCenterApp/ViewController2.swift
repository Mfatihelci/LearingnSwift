//
//  ViewController2.swift
//  NotificationCenterApp
//
//  Created by fatih on 1.03.2022.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func gonder(_ sender: Any) {
        
        let kisi = Kisiler(kisi_ad: "ahmet", kisi_yas: 18)
        
        NotificationCenter.default.post(name: .bildirimAdi, object: nil, userInfo: ["mesaj":"merhaba","tarih":Date(),"nesne":kisi])
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
