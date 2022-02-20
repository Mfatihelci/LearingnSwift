//
//  ViewController.swift
//  tableviewbuttonekleme2
//
//  Created by fatih on 7.02.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var kisilerTableView: UITableView!
    
    var kisiListesi = [Kisiler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        let k1 = Kisiler(kisiId: 1, kisiAd: "ahmet", kisiTel: "4665654565")
        let k2 = Kisiler(kisiId: 2, kisiAd: "mehmet", kisiTel: "44444444")
        let k3 = Kisiler(kisiId: 3, kisiAd: "ayşe", kisiTel: "3333333")
        let k4 = Kisiler(kisiId: 4, kisiAd: "defne", kisiTel: "222222222")
        let k5 = Kisiler(kisiId: 5, kisiAd: "mete", kisiTel: "11111111")
        
        kisiListesi.append(k1)
        kisiListesi.append(k2)
        kisiListesi.append(k3)
        kisiListesi.append(k4)
        kisiListesi.append(k5)
        
        
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource,TableViewHucreProtocol {
    func hucreuzerindeibuttontiklandi(indexPath: IndexPath) {
        print("button tıklandı : \(kisiListesi[indexPath.row].kisiAd!)")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisiListesi.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let gelenkisi = kisiListesi[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre", for: indexPath) as! TableViewHucre
        
        cell.kisilerLable.text = gelenkisi.kisiAd!
        
        cell.hucreprotocol = self
        cell.indexPath = indexPath
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let gelenKisi = kisiListesi[indexPath.row]
        
        print("ID: \(gelenKisi.kisiId!) ad: \(gelenKisi.kisiAd!) tel: \(gelenKisi.kisiTel!)")
    }
}
