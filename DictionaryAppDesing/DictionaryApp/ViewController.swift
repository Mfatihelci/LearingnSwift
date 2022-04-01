//
//  ViewController.swift
//  DictionaryApp
//
//  Created by fatih on 24.02.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var kelimeTableView: UITableView!
    
    var kelimeListesi = [Kelimeler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let k1 = Kelimeler(kelime_id: 1, ingilizce: "table", turkce: "masa")
        let k2 = Kelimeler(kelime_id: 2, ingilizce: "door", turkce: "kapı")
        let k3 = Kelimeler(kelime_id: 3, ingilizce: "window", turkce: "pencere")
        
        kelimeListesi.append(k1)
        kelimeListesi.append(k2)
        kelimeListesi.append(k3)
        
        kelimeTableView.delegate = self
        kelimeTableView.dataSource = self
        
        searchBar.delegate = self
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kelimeListesi.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let kelime = kelimeListesi[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "kelimeHucre", for: indexPath) as! KelimeHucreTableViewCell
        
        cell.ingilizceLabel.text = kelime.ingilizce
        cell.turkceLabel.text = kelime.turkce
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toKelimeDetay", sender: indexPath.row)
    }
    
}

extension ViewController:UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("arama : \(searchText)")
    }
    
}
