//
//  Kategoriler.swift
//  MovieApp
//
//  Created by fatih on 26.02.2022.
//

import Foundation

class Kategoriler {
    var kategori_id:Int?
    var kategori_ad:String?
    
    init() {
        
    }
    
    init(kategori_id:Int,kategori_ad:String) {
        self.kategori_id = kategori_id
        self.kategori_ad = kategori_ad
    }
}
