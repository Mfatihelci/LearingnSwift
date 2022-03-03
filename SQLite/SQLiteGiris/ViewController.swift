//
//  ViewController.swift
//  SQLiteGiris
//
//  Created by fatih on 19.02.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        veritabanikopyala()
        
    }

    
    func veritabanikopyala(){
        let bundleYolu = Bundle.main.path(forResource: "kisilergiris", ofType:
            ".sqlite")
        
        let hedefYol = NSSearchPathForDirectoriesInDomains (.documentDirectory,
             .userDomainMask, true).first!
        
        let fileManager = FileManager.default
        
        let kopyalanacakYer = URL (fileURLWithPath:
            hedefYol).appendingPathComponent ("kisilergiris.sqlite")
        
        if fileManager.fileExists (atPath: kopyalanacakYer.path) {
            print ("Veritabanı zaten var.Kopyalamaya gerek yok")
        }else{
            do {
                 try fileManager.copyItem(atPath: bundleYolu!, toPath:
                     kopyalanacakYer.path)
            }catch{
                 print(error)
                
            }
        }
    }

}
