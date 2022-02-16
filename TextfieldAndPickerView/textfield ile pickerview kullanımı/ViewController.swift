//
//  ViewController.swift
//  textfield ile pickerview kullanımı
//
//  Created by fatih on 2.02.2022.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    @IBOutlet weak var textfieldUlke: UITextField!
    
    var pickerView:UIPickerView?
    
    var ulkeler:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        ulkeler = ["türkiye","italya","cin","abd","fransa"]
        
        
        pickerView = UIPickerView()
        pickerView?.dataSource = self
        pickerView?.delegate = self
        
        textfieldUlke.inputView = pickerView
        
        let toolbar = UIToolbar()
        toolbar.tintColor = UIColor.red
        toolbar.sizeToFit()
        
        let tamamButton = UIBarButtonItem (title: "Tamam", style: .plain, target: self, action: #selector(ViewController.tamamTikla))
        
        let boslukButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let iptalButton = UIBarButtonItem (title: "iptal", style: .plain, target: self, action: #selector(self.iptalTikla))
        
        toolbar.setItems([iptalButton,boslukButton,tamamButton], animated: true)
        
        textfieldUlke.inputAccessoryView = toolbar
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ulkeler.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ulkeler[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textfieldUlke.text = ulkeler[row]
    }
    @objc func tamamTikla(){
        textfieldUlke.text = " "
        textfieldUlke.placeholder = "ülke seç"
        view.endEditing(true)
    }
    @objc func iptalTikla(){
        view.endEditing(true)
        
    }

}

