//
//  CollectionViewCellFilm.swift
//  detaylıCollectionView
//
//  Created by fatih on 7.02.2022.
//

import UIKit

protocol CollectionViewCellFilmProtocol {
    func sepeteEkle(indexPath:IndexPath)
}


class CollectionViewCellFilm: UICollectionViewCell {
    @IBOutlet weak var filmImageView: UIImageView!
    @IBOutlet weak var filmLabelAdi: UILabel!
    
    @IBOutlet weak var filmLabelFiyat: UILabel!
    
    var hucreprotocol:CollectionViewCellFilmProtocol?
    var indexPath:IndexPath?
    
    @IBAction func sepeteEkleButton(_ sender: Any) {
    
        hucreprotocol?.sepeteEkle(indexPath: indexPath!)
        
    }
}
