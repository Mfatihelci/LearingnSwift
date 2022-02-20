//
//  TableViewHucre.swift
//  tableviewbuttonekleme2
//
//  Created by fatih on 7.02.2022.
//

import UIKit

protocol TableViewHucreProtocol{
    func hucreuzerindeibuttontiklandi(indexPath:IndexPath)
}

class TableViewHucre: UITableViewCell {
    
    var hucreprotocol:TableViewHucreProtocol?
    var indexPath:IndexPath?

    @IBOutlet weak var kisilerLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

 }

    @IBAction func ButtonTiklandi(_ sender: Any) {
    
        hucreprotocol?.hucreuzerindeibuttontiklandi(indexPath: indexPath!)
    
    }
}
