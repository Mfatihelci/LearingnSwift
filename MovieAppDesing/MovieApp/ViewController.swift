//
//  ViewController.swift
//  MovieApp
//
//  Created by fatih on 14.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var kisilerTableView: UITableView!
    
    var liste = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        liste = ["Ahmet","Ece","Zeynep","Mehmet","Talat"]
        
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        searchBar.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        
    }
}
extension ViewController:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liste.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "kisiHucre", for: indexPath) as! KisiHucreTableViewCell
        
        cell.kisiYaziLabel.text = liste[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetay", sender: indexPath.row)
    }
    /*
    //ESKİ KODLAMA YAPISI
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let silAction = UITableViewRowAction(style: .default, title: "Sil", handler: { (action:UITableViewRowAction,indexPath:IndexPath)-> Void in
            
            print("Sil tıklandı \(self.liste[indexPath.row])")
        })
        
        let guncelleAction = UITableViewRowAction(style: .normal, title: "Güncelle", handler: { (action:UITableViewRowAction,indexPath:IndexPath)-> Void in
            
            print("Güncelle tıklandı \(self.liste[indexPath.row])")
            
            self.performSegue(withIdentifier: "toGuncelle", sender: indexPath.row)
            
        })
        
        return [silAction,guncelleAction]
        
    }*/
    
    //YENİ KODLAMA YAPISI
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") {  (contextualAction, view, boolValue) in
            
             print("Sil tıklandı \(self.liste[indexPath.row])")
        }
        
        let guncelleAction = UIContextualAction(style: .normal, title: "Güncelle") {  (contextualAction, view, boolValue) in
            
             print("Güncelle tıklandı \(self.liste[indexPath.row])")
             
             self.performSegue(withIdentifier: "toGuncelle", sender: indexPath.row)
        }

        return UISwipeActionsConfiguration(actions: [silAction,guncelleAction])
    }
    
    
}

extension ViewController:UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Arama sonuç : \(searchText)")
    }
    
}




