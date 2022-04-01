//
//  NetworkConstant.swift
//  RickAndMortyProgrammaticTableview
//
//  Created by fatih on 29.03.2022.
//

import Foundation

enum RickMortyServiceEndPoint : String {
    case base_url = "https://rickandmortyapi.com/api"
    case path = "/character"
    
    static func characterPaht() -> String{
        return "\(base_url.rawValue)\(path.rawValue)"
    }
}
