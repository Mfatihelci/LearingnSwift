//
//  filmler.swift
//  detaylıCollectionView
//
//  Created by fatih on 7.02.2022.
//

import Foundation

class Filmler {
    var filmBaslik:String?
    var filmFiyat:Double?
    var filmResimAdi:String?
    var filmId:Int?
    
    init(){
        
    }
    init(filmBaslik:String,filmFiyat:Double,filmResimAdi:String,filmId:Int){
        
        self.filmBaslik = filmBaslik
        self.filmFiyat = filmFiyat
        self.filmResimAdi = filmResimAdi
        self.filmId = filmId
        
    }
    
}
