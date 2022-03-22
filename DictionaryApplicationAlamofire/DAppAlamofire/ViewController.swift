//
//  ViewController.swift
//  DictionaryApp
//
//  Created by fatih on 24.02.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var kelimeTableView: UITableView!
    
    var kelimeListesi = [Kelimeler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kelimeTableView.delegate = self
        kelimeTableView.dataSource = self
        
        searchBar.delegate = self
        
        tumKelimelerAl()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        
        let gidilecekVC = segue.destination as! KelimeDetayViewController
        
        gidilecekVC.kelime = kelimeListesi[indeks!]
    }
    
    func tumKelimelerAl(){
        Alamofire.request("http://kasimadalan.pe.hu/sozluk/tum_kelimeler.php",method: .get).responseJSON{ response in
            
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(SozlukCevap.self, from: data)
                    
                    if let gelenKelimeListesi = cevap.kelimeler {
                        
                        self.kelimeListesi = gelenKelimeListesi
                    }
                    DispatchQueue.main.async {
                        self.kelimeTableView.reloadData()
                    }
                } catch  {
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    func aramaYap(aramaKelimesi:String){
        
        let parametreler:Parameters = ["ingilizce":aramaKelimesi]
        
        Alamofire.request("http://kasimadalan.pe.hu/sozluk/kelime_ara.php",method: .post,parameters: parametreler).responseJSON{ response in
            
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(SozlukCevap.self, from: data)
                    
                    if let gelenKelimeListesi = cevap.kelimeler {
                        
                        self.kelimeListesi = gelenKelimeListesi
                    }
                    DispatchQueue.main.async {
                        self.kelimeTableView.reloadData()
                    }
                } catch  {
                    print(error.localizedDescription)
                }
            }
            
        }
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
        
        aramaYap(aramaKelimesi:searchText)
    }
    
}
