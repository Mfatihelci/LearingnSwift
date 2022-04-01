//
//  RickMortyViewModel.swift
//  RickAndMortyProgrammaticTableview
//
//  Created by fatih on 28.03.2022.
//

import Foundation

protocol IRickMortyViewModel {
    
    func fetchItem()
    func changeLoading()
    
    var rickMortyCharacter: [Result] { get set }
    var rickMortyService: IRickMortyService { get }
    
    var rickMortyOutPut: RickMortyOutPut? { get }
    func setDelegate(output: RickMortyOutPut)
}

final class RickMortyViewModel: IRickMortyViewModel{
    var rickMortyOutPut: RickMortyOutPut?
    
    func setDelegate(output: RickMortyOutPut) {
        rickMortyOutPut = output
    }
    
    var rickMortyCharacter: [Result] = []
    private var isLoading = false
    
    let rickMortyService: IRickMortyService
    
    init() {
        rickMortyService = RickMortyService()
    }
    
    func fetchItem() {
        changeLoading()
        rickMortyService.fetchAllDatas { [weak self] (response) in
            self?.changeLoading()
            self?.rickMortyCharacter = response ?? []
            self?.rickMortyOutPut?.saveDatas(values: self?.rickMortyCharacter ?? [])
        }
    }
    
    func changeLoading() {
        isLoading = !isLoading
        rickMortyOutPut?.changeLoading(isLoad: isLoading)
    }
}
