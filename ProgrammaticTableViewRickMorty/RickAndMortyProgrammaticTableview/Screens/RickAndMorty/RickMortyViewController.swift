//
//  RickMortyViewController.swift
//  RickAndMortyProgrammaticTableview
//
//  Created by fatih on 28.03.2022.
//

import UIKit
import SnapKit

protocol RickMortyOutPut {
    func changeLoading(isLoad: Bool)
    func saveDatas(values: [Result])
}

final class RickMortyViewController: UIViewController {

    private let labelTitle: UILabel = UILabel()
    private let tableView: UITableView = UITableView()
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    private lazy var result: [Result] = []
    
    lazy var viewModel: RickMortyViewModel = RickMortyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewModel.setDelegate(output: self)
        viewModel.rickMortyOutPut = self
        viewModel.fetchItem()
    }
    
    private func configure(){
        view.backgroundColor = .white
        view.addSubview(labelTitle)
        view.addSubview(tableView)
        view.addSubview(indicator)
        drawDesing()
        makeLabel()
        makeIndicator()
        maketableView()
    }
    
    private func drawDesing(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            RickyMortyTableViewCell.self,
            forCellReuseIdentifier: RickyMortyTableViewCell.Identifier.custom.rawValue
        )
        
        self.labelTitle.font = .boldSystemFont(ofSize: 25)
        self.labelTitle.text = RickTitle.title.rawValue
        self.indicator.color = .red
        tableView.rowHeight = 150
        indicator.startAnimating()
    }
}

extension RickMortyViewController: RickMortyOutPut {
    func changeLoading(isLoad: Bool) {
        isLoad ? indicator.startAnimating() : indicator.stopAnimating()
    }
    
    func saveDatas(values: [Result]) {
        result = values
        tableView.reloadData()
    }
}

extension RickMortyViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RickyMortyTableViewCell.Identifier.custom.rawValue) as? RickyMortyTableViewCell else {
            return UITableViewCell()
        }
        cell.saveModel(model: result[indexPath.row])
        return cell
    }
}

extension RickMortyViewController {
    private func makeLabel(){
        labelTitle.snp.makeConstraints {(make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(15)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.greaterThanOrEqualTo(10)
        }
    }
    
    private func maketableView(){
        tableView.snp.makeConstraints {(make) in
             make.top.equalTo(labelTitle.snp.bottom).offset(10)
             make.bottom.equalToSuperview()
             make.left.right.equalTo(labelTitle)
         }
    }
    
    private func makeIndicator(){
        indicator.snp.makeConstraints {(make) in
            make.top.equalTo(labelTitle)
            make.right.equalTo(labelTitle).offset(-5)
            make.height.equalTo(labelTitle)
        }
    }
}
