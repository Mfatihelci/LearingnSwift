//
//  ViewController.swift
//  userdefault calismasi
//
//  Created by fatih on 9.02.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let d = UserDefaults.standard
        
        d.set("ahmet", forKey: "ad")
        d.set( 18, forKey: "yas")
        d.set(1.75 , forKey: "boy")
        d.set(true, forKey: "medeniDurum")
        
        let arkadasListesi = ["ali","veli","ayşe"]
        
        d.set(arkadasListesi, forKey: "liste")
        
        let sehirlerListesi:[String:String] = ["16":"bursa","34":"istanbul"]
        d.set(sehirlerListesi, forKey: "dict")
        
        let ad = d.string(forKey: "ad") ?? "isim yok"
        let yas = d.integer(forKey: "yas")
        let boy = d.double(forKey: "boy")
        let medeniDurum = d.bool(forKey: "medeniDurum")
        
        print(ad)
        print(yas)
        print(boy)
        print(medeniDurum)
        
        let liste = d.array(forKey: "liste") as? [String] ?? [String] ()
        print(liste[0])
        
        let dict = d.dictionary(forKey: "dict") as? [String:String] ?? [String:String]()
        print(dict["16"]!)
        
        //d.removeObject(forKey: "ad")
        //let adx = d.string(forKey: "ad") ?? "isin yok"
        //print(adx)
        
        d.set("yeni ahmet", forKey: "ad")
        let adx = d.string(forKey: "ad") ?? "isim yok"
        print(adx)
        
        
        
        
        
    }


}

