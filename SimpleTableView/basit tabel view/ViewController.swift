//
//  ViewController.swift
//  basit tabel view
//
//  Created by fatih on 2.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var ulkeler:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ulkeler = ["türkiye","fransa","çin","ingiltere","almanya","ukrayna","iran","litvanya","güney kore"]
        
        tableview.dataSource = self
        tableview.delegate = self
    }
}

extension ViewController:UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ulkeler.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "hucreadi", for: indexPath)
        
        cell.textLabel?.text = ulkeler[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("seçilen ülke : \(ulkeler[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let silAction = UITableViewRowAction(style: .default, title: "sil", handler: { (action:UITableViewRowAction,indexPath:IndexPath) -> Void in
            
            print("\(self.ulkeler[indexPath.row]) yi sil")
            
        })
        let duzenleAction = UITableViewRowAction(style: .normal, title: "düzenle", handler: { (action:UITableViewRowAction,indexPath:IndexPath) -> Void in
            
            print("\(self.ulkeler[indexPath.row]) yi düzenle")
            
        })
        
        return [silAction,duzenleAction]
    
 }
    
}
