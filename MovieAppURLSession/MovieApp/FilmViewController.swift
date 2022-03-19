//
//  FilmViewController.swift
//  MovieApp
//
//  Created by fatih on 26.02.2022.
//

import UIKit

class FilmViewController: UIViewController {

    @IBOutlet weak var filmCollectionView: UICollectionView!
    
    var filmListesi = [Filmler]()
    var kategori:Kategoriler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        filmCollectionView.delegate = self
        filmCollectionView.dataSource = self
        
        let tasarim:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let genislik = self.filmCollectionView.frame.size.width
        
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let hucreGenislik = (genislik-30)/2
        
        tasarim.itemSize = CGSize(width: hucreGenislik, height: hucreGenislik*1.7)
        
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        
        filmCollectionView.collectionViewLayout = tasarim
        
        if let k = kategori {
            if let kid = Int(k.kategori_id!) {
                navigationItem.title = k.kategori_ad
                
                filmKategoriID(kategor_id: kid)
            }
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        
        let gidilecekVC = segue.destination as! FilmDetayViewController
        gidilecekVC.film = filmListesi[indeks!]
    }
    
    func filmKategoriID(kategor_id:Int) {
        
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/filmler/filmler_by_kategori_id.php")!)
        
        request.httpMethod = "POST"
        
        let postString = "kategori_id=\(kategor_id)"
        
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data,response,error in
            
            if error != nil || data == nil {
                print("hata")
                return
            }
            do {
                let cevap = try JSONDecoder().decode(FilmCevap.self, from: data!)
                
                if let gelenFilmListesi = cevap.filmler {
                    self.filmListesi = gelenFilmListesi
                }
                
                DispatchQueue.main.async {
                    self.filmCollectionView.reloadData()
                }
                
            } catch  {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
}

extension FilmViewController:UICollectionViewDelegate,UICollectionViewDataSource,FilmHucreCollectionViewCellProtocol {
    func sepeteEkle(indexPath: IndexPath) {
        print("sepete eklenen : \(filmListesi[indexPath.row].film_ad!)")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmListesi.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let film = filmListesi[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmHucre", for: indexPath) as! FilmHucreCollectionViewCell
        
        cell.labelFilmAdi.text = film.film_ad
        cell.labelFilmFiyat.text = "14.99"
        
        if let url = URL(string: "http://kasimadalan.pe.hu/filmler/resimler/\(film.film_resim!)"){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    cell.imageViewFilmResim.image = UIImage(data: data!)
                }
            }
        }
        
        cell.imageViewFilmResim.image = UIImage(named: film.film_resim!)
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        
        cell.hucreProtocol = self
        cell.indexPath = indexPath
        
        return cell
    
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetay", sender: indexPath.row)
    }
}
