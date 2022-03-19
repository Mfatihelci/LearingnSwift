//
//  FilmDetayViewController.swift
//  MovieApp
//
//  Created by fatih on 26.02.2022.
//

import UIKit

class FilmDetayViewController: UIViewController {

    @IBOutlet weak var imageViewFilmResim: UIImageView!
    @IBOutlet weak var labelFilmAd: UILabel!
    @IBOutlet weak var labelFimYil: UILabel!
    @IBOutlet weak var labelFilmKategori: UILabel!
    @IBOutlet weak var labelFilmYonetmen: UILabel!
    
    var film:Filmler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let f = film {
            
            if let url = URL(string: "http://kasimadalan.pe.hu/filmler/resimler/\(f.film_resim!)"){
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: url)
                    
                    DispatchQueue.main.async {
                        self.imageViewFilmResim.image = UIImage(data: data!)
                    }
                }
            }
            labelFilmAd.text = f.film_ad
            labelFimYil.text = f.film_yil
            labelFilmKategori.text = f.kategori?.kategori_ad
            labelFilmYonetmen.text = f.yonetmen?.yonetmen_ad
            
        }
    }

}
