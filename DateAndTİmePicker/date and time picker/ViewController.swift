//
//  ViewController.swift
//  date and time picker
//
//  Created by fatih on 1.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldTarih: UITextField!
  
    @IBOutlet weak var textFieldSaat: UITextField!
   
    var datePicker:UIDatePicker?
    
    var timePicker:UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        textFieldTarih.inputView = datePicker
        
        timePicker = UIDatePicker()
        datePicker?.datePickerMode = .time
        textFieldSaat.inputView = datePicker
        
        
        datePicker?.addTarget(self, action: #selector(self.tarihGoster(datePicker:)), for: .valueChanged)
        
        datePicker?.addTarget(self, action: #selector(self.tarihGoster(datePicker:)), for: .valueChanged)
        
        
        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(self.dokunmaAlgilamaMetod))
        
        view.addGestureRecognizer(dokunmaAlgilama)
        
    }
    @objc func tarihGoster(datePicker:UIDatePicker){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let alinanTarih = dateFormatter.string(from: datePicker.date)
        
        textFieldTarih.text = alinanTarih
    }
        
       func saatGoster(timePicker:UIDatePicker){
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm"
            let alinanSaat = dateFormatter.string(from: timePicker.date)
            textFieldSaat.text = alinanSaat
        
    }
    @objc func dokunmaAlgilamaMetod () {
        view.endEditing(true)
    }

}

