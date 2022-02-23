//
//  ViewController.swift
//  detaylıCollectionView
//
//  Created by fatih on 7.02.2022.
//

import UIKit

class ViewController: UIViewController{
   
    
    @IBOutlet weak var filmCollectionView: UICollectionView!
    
    var filmlerListesi = [Filmler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tasarim:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let genislik = self.filmCollectionView.frame.size.width
        
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        
        
        let hucreGenislik = (genislik-30)/2
        
        tasarim.itemSize = CGSize(width: hucreGenislik, height: hucreGenislik*2.2)
        
        filmCollectionView!.collectionViewLayout = tasarim
        
        filmCollectionView.delegate = self
        filmCollectionView.dataSource = self
        
      
        let f1 = Filmler(filmBaslik: "Django", filmFiyat: 15.99, filmResimAdi: "django", filmId: 1)
        let f2 = Filmler(filmBaslik: "Inception", filmFiyat: 15.99, filmResimAdi: "inception", filmId: 2)
        let f3 = Filmler(filmBaslik: "Interstellar", filmFiyat: 15.99, filmResimAdi: "interstellar", filmId: 3)
        let f4 = Filmler(filmBaslik: "anadoluda", filmFiyat: 15.99, filmResimAdi: "birzamanlaranadoluda", filmId: 4)
        let f5 = Filmler(filmBaslik: "The Hateful Eight", filmFiyat: 15.99, filmResimAdi: "thehatefuleight", filmId: 5)
        let f6 = Filmler(filmBaslik: "The Pianist", filmFiyat: 15.99, filmResimAdi: "thepianist", filmId: 6)
        
        
        filmlerListesi.append(f1)
        filmlerListesi.append(f2)
        filmlerListesi.append(f3)
        filmlerListesi.append(f4)
        filmlerListesi.append(f5)
        filmlerListesi.append(f6)
    }


}
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,CollectionViewCellFilmProtocol{
    func sepeteEkle(indexPath: IndexPath) {
        let gelenFilm = filmlerListesi[indexPath.row]
        
        print("sepete eklenen film \(gelenFilm.filmBaslik!)")
    }
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmlerListesi.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let gelenFilm = filmlerListesi[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmHucre", for: indexPath) as! CollectionViewCellFilm
        
        cell.filmLabelAdi.text = gelenFilm.filmBaslik!
        cell.filmLabelFiyat.text = "\(gelenFilm.filmFiyat!) tl"
        cell.filmImageView.image = UIImage(named: gelenFilm.filmResimAdi!)
        
        cell.hucreprotocol = self
        cell.indexPath = indexPath
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let gelenFilm = filmlerListesi[indexPath.row]
        
        print("seçilen film \(gelenFilm.filmBaslik!)")
    }
    
    
}

