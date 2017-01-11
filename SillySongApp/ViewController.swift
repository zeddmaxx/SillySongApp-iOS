//
//  ViewController.swift
//  SillySongApp
//
//  Created by Azhar93 on 05/01/17.
//  Copyright © 2017 Zoya96. All rights reserved.
//

import UIKit


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}


func shortNameForName(name :String) -> String
{
    let z = name.lowercased()
    let vowelset = CharacterSet(charactersIn: "aeiou")
    //These could also have been written!
    //let ind =  z.rangeOfCharacter(from: vowelset)
    //let sname = z.substring(from: ind!.lowerBound)
    
    let sname = z.substring(from: (z.rangeOfCharacter(from: vowelset)?.lowerBound)!)
    
    return sname
    
}




let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    
    let shortName = shortNameForName(name: fullName)
    
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
}




class ViewController: UIViewController {

    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
        
        
        
    }
    

    @IBAction func displayLyrics(_ sender: Any) {
        
        if nameField.text != ""
        {
            
        let lyr = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
          lyricsView.text = lyr
            
            
           
        }
    }
    
    
    
    
}

