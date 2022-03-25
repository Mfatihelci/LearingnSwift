//
//  FilmViewController.swift
//  MovieApp
//
//  Created by fatih on 26.02.2022.
//

import UIKit
import Alamofire

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
            if let kid = Int(k.kategori_id!){
                navigationItem.title = k.kategori_ad
                filmlerByKategoriID(kategori_id: kid)
            }
            
        }
        
    }
    func filmlerByKategoriID(kategori_id:Int){
        let parametreler:Parameters = ["kategori_id":kategori_id]
        
        Alamofire.request("http://kasimadalan.pe.hu/filmler/filmler_by_kategori_id.php",method: .post,parameters: parametreler).responseJSON{
            response in
            if let data = response.data{
                do {
                    let cevap = try JSONDecoder().decode(FilmCevap.self, from: data)
                    if let gelenFilmListesi = cevap.filmler{
                        self.filmListesi = gelenFilmListesi
                    }
                    DispatchQueue.main.async {
                        self.filmCollectionView.reloadData()
                    }
                    
                } catch  {
                    print(error.localizedDescription)
                }
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        
        let gidilecekVC = segue.destination as! FilmDetayViewController
        
        gidilecekVC.film = filmListesi[indeks!]
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
