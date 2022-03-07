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
            imageViewFilmResim.image = UIImage(named: f.film_resim!)
            
            labelFilmAd.text = f.film_ad
            labelFimYil.text = String(f.film_yil!)
            
            labelFilmKategori.text = f.kategori?.kategori_ad
            labelFilmYonetmen.text = f.yonetmen?.yonetmen_ad
            
        }
        
    }
   
}
