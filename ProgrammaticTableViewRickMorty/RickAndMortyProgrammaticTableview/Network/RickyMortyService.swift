//
//  RickyMortyService.swift
//  RickAndMortyProgrammaticTableview
//
//  Created by fatih on 28.03.2022.
//

import Alamofire

protocol IRickMortyService{
    func fetchAllDatas(response: @escaping ([Result]?) -> Void)
}

struct RickMortyService: IRickMortyService{
    func fetchAllDatas(response: @escaping ([Result]?) -> Void) {
        AF.request(RickMortyServiceEndPoint.characterPaht()).responseDecodable(of:PostModel.self){ (model) in
            guard let data = model.value else{
                response(nil)
                return
            }
            response(data.results)
        }
    }
}


