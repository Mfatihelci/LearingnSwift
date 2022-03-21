//
//  ViewController.swift
//  KisilerUygulaması
//
//  Created by fatih on 17.02.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var kisilerTableView: UITableView!
    
    var kisilerListe = [Kisiler] ()
    
    var aramaYapiliyorMu = false
    var aramaKelimesi:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        searchBar.delegate = self
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        if aramaYapiliyorMu {
            aramaYap(aramaKelimesi: aramaKelimesi!)
        }else{
            tumKisilerAl()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
         
         if segue.identifier == "toDetay"{
             let gidilecekVC = segue.destination as! KisiDetayViewController
             gidilecekVC.kisi = kisilerListe[indeks!]
         }
         
         if segue.identifier == "toGuncelle"{
             let gidilecekVC = segue.destination as! KisiGuncelleViewController
             gidilecekVC.kisi = kisilerListe[indeks!]
         }
        
    }
    
    func tumKisilerAl(){
        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php")!
        
        URLSession.shared.dataTask(with: url) { data,response,error in
            if error != nil || data == nil {
                print("hata")
                return
            }
            do {
                let cevap = try JSONDecoder().decode(KisiCevap.self, from: data!)
                if let gelenKisiListe = cevap.kisiler {
                    self.kisilerListe = gelenKisiListe
                }else{
                    self.kisilerListe = [Kisiler]()
                }
                DispatchQueue.main.async {
                    self.kisilerTableView.reloadData()
                }
                
            } catch  {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    func aramaYap(aramaKelimesi:String){
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php")!)
        
        request.httpMethod = "POST"
        
        let postString = "kisi_ad=\(aramaKelimesi)"
        
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data,response,error in
            if error != nil || data == nil {
                print("hata")
                return
            }
            do {
                let cevap = try JSONDecoder().decode(KisiCevap.self, from: data!)
                if let gelenKisiListe = cevap.kisiler {
                    self.kisilerListe = gelenKisiListe
                }else{
                    self.kisilerListe = [Kisiler]()
                }
                DispatchQueue.main.async {
                    self.kisilerTableView.reloadData()
                }
                
            } catch  {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    func kisiSil(kisi_id:Int){
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php")!)
        
        request.httpMethod = "POST"
        
        let postString = "kisi_id=\(kisi_id)"
        
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data,response,error in
            if error != nil || data == nil {
                print("hata")
                return
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] {
                    print(json)
                    if self.aramaYapiliyorMu {
                        self.aramaYap(aramaKelimesi: self.aramaKelimesi!)
                    }else{
                        self.tumKisilerAl()
                    }
                }
                
            } catch  {
                print(error.localizedDescription)
            }
            
        }.resume()
    }

}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListe.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let kisi = kisilerListe[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "kisiHucre", for: indexPath) as! KisiHucreTableViewCell
        
        cell.kisiYaziLabel.text = "\(kisi.kisi_ad!) - \(kisi.kisi_tel!)"
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "toDetay", sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") {  (contextualAction, view, boolValue) in
            
            let kisi = self.kisilerListe[indexPath.row]
            
            if let kid = Int(kisi.kisi_id!){
                self.kisiSil(kisi_id: kid)
                
            }
         
        }
        
        let guncelleAction = UIContextualAction(style: .normal, title: "Güncelle") {  (contextualAction, view, boolValue) in
            
             
             self.performSegue(withIdentifier: "toGuncelle", sender: indexPath.row)
        }

        return UISwipeActionsConfiguration(actions: [silAction,guncelleAction])
    }
    
}

extension ViewController:UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        aramaKelimesi = searchText
        
        if searchText == ""{
            aramaYapiliyorMu = false
        }else{
            aramaYapiliyorMu = true
        }
        aramaYap(aramaKelimesi: aramaKelimesi!)
        
    }
    
}

