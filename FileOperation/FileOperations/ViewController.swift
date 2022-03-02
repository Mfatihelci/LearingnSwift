//
//  ViewController.swift
//  FileOperations
//
//  Created by fatih on 14.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldEnter: UITextField!
    @IBOutlet weak var pictureHolder: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func write(_ sender: Any) {
        
        let message:String = textFieldEnter.text!
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let filePath = dir.appendingPathComponent("file.txt")
            
            do {
                try message.write(to: filePath, atomically: false, encoding: String.Encoding.utf8)
                
                textFieldEnter.text = ""
                
            }catch{
                print("An error occurred while writing the file")
        }
        
      }
        
    }
    
    @IBAction func read(_ sender: Any) {
        
            
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let filePath = dir.appendingPathComponent("file.txt")
            
            do {
                textFieldEnter.text = try String(contentsOf: filePath, encoding: String.Encoding.utf8)
                
            }catch{
                print("An error occurred while writing the file")
        }
        
      }
        
    }
    
    @IBAction func deleted(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let filePath = dir.appendingPathComponent("file.txt")
            
            if FileManager.default.fileExists(atPath: filePath.path){
                
                do {
                    
                    try FileManager.default.removeItem(at: filePath)
                    
                    textFieldEnter.text = ""
                    
                }catch{
                    print("Error deleting file")
                }

            }
            
        }
        
    }
    
    @IBAction func savePicture(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let filePath = dir.appendingPathComponent("picture.png")
            
            let picture = UIImage(named: "picture")
            
            do {
                
                try picture!.pngData()?.write(to: filePath)
                
            }catch{
                print("An error occurred while taking the picture.")
            }
            
        }
        
    }
    
    @IBAction func showPicture(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let filePath = dir.appendingPathComponent("picture.png")
            
            self.pictureHolder.image =  UIImage(contentsOfFile: filePath.path)
            
        }
        
    }
    @IBAction func deletePicture(_ sender: Any) {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let filePath = dir.appendingPathComponent("picture.png")
            
            if FileManager.default.fileExists(atPath: filePath.path){
                
                do {
                    
                    try FileManager.default.removeItem(at: filePath)
                    
                    
                }catch{
                    print("Error deleting image")
                }
                
            }
            
        }
        
    }
    
}

