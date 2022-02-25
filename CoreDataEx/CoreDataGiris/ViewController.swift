//
//  ViewController.swift
//  CoreDataGiris
//
//  Created by fatih on 15.02.2022.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate

class ViewController: UIViewController {
    
    let context = appDelegate.persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func veriKaydi () {
        
        let kisi = Kisiler(context: context)
    }

}

