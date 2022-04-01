//
//  RickMortyTableViewCell.swift
//  RickAndMortyProgrammaticTableview
//
//  Created by fatih on 29.03.2022.
//

import UIKit
import AlamofireImage

class RickyMortyTableViewCell: UITableViewCell {
    
    let customImage: UIImageView = UIImageView()
    let title: UILabel = UILabel()
    let customDescription: UILabel = UILabel()
    
    private let randomImage: String = "https://picsum.photos/200/300"
    
    enum Identifier: String {
        case custom = "cell"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(customImage)
        addSubview(title)
        addSubview(customDescription)
        maketitle()
        makecustomImage()
        makecustomDescription()
        
        title.font = .boldSystemFont(ofSize: 15)
        customDescription.font = .italicSystemFont(ofSize: 15)
    }
    
    func saveModel(model: Result){
        title.text = model.name
        customDescription.text = model.status?.rawValue
        customImage.af.setImage(withURL: URL(string: model.image ?? randomImage) ?? URL(string: randomImage)!)
    }
}

extension RickyMortyTableViewCell {
    
    private func makecustomImage(){
        customImage.snp.makeConstraints {(make) in
            make.height.equalTo(100)
            make.top.equalTo(contentView).offset(10)
            make.width.equalTo(250)
        }
    }
    
    private func maketitle(){
        title.snp.makeConstraints {(make) in
            make.top.equalTo(customImage.snp.bottom).offset(10)
            make.left.equalTo(contentView).offset(10)
        }
    }
    
    private func makecustomDescription(){
        customDescription.snp.makeConstraints {(make) in
            make.top.equalTo(title.snp.bottom).offset(5)
            make.left.equalTo(contentView).offset(10)
        }
    }
}
