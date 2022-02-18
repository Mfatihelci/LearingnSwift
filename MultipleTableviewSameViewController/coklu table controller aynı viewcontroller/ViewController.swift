//
//  ViewController.swift
//  coklu table controller aynı viewcontroller
//
//  Created by fatih on 2.02.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableViewUlkeler: UITableView!
    
    @IBOutlet weak var tableViewSehirler: UITableView!
    
    var countries:[String] = [String]()
    var cities:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        countries = ["turkey","italy","france","england","germany"]
        cities = ["berlin","istanbul","paris","roma"]
        
        tableViewUlkeler.delegate = self
        tableViewUlkeler.dataSource = self
        tableViewSehirler.delegate = self
        tableViewSehirler.dataSource = self
        
  }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var numberOfData:Int?
        
        if tableView == tableViewUlkeler {
            numberOfData = countries.count
        }
        if tableView == tableViewSehirler {
            numberOfData = cities.count
        }
        return numberOfData!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell?
        
        if tableView == tableViewUlkeler {
            
            cell = tableView.dequeueReusableCell(withIdentifier: "countriesCell", for: indexPath)
            
            cell?.textLabel?.text = countries[indexPath.row]
        }
        
        if tableView == tableViewSehirler {
            
            cell = tableView.dequeueReusableCell(withIdentifier: "citiesCell",  for: indexPath)
            
            cell?.textLabel?.text = cities[indexPath.row]
        }
     return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == tableViewUlkeler {
            print("selected country : \(countries[indexPath.row])")
        }
        if tableView == tableViewSehirler {
            print("selected city : \(cities[indexPath.row])")
        }
    }
    
}

