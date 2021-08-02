//
//  EmotionPickerViewController.swift
//  journal
//
//  Created by WONG TED LUAN on 26/07/2021.
//  Copyright © 2021 WONG TED LUAN. All rights reserved.
//

import UIKit


class EmotionPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var moodPicker: UIPickerView!
    @IBOutlet weak var DoneButton: UIButton!
    @IBOutlet weak var MoodLabel: UILabel!
    
    var emotion : [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moodPicker.delegate = self
        moodPicker.dataSource = self
        
        // get path of the property list file
        if let filePath = Bundle.main.path(forResource: "EmotionList", ofType: "plist"){
            
            // get Data from the file
            if let plistData = FileManager.default.contents(atPath: filePath) {
                do {
                    // deserialize Data and return a property list
                    //  of type Any
                    let plistObject = try PropertyListSerialization.propertyList(
                        from: plistData,
                        options: PropertyListSerialization.ReadOptions(),
                        format: nil)
                    
                    // downcast the property list to an
                    //    optional array of Strings
                    let EmotionList = plistObject as? [String]
                    
                    emotion = EmotionList
                    
                } catch {
                    print("Error serializing data from property list")
                }
            } else {
                print("Error reading data from property list file")
            }
        } else {
            print("Property list file does not exist")
        }
    }
    
    
    //set up picker view variable
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return emotion.count
    }
    
    
    func  numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return emotion[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        MoodLabel.text = emotion[row]
        
    }
    
    //pass the data to MainVC 
    @IBAction func PressedDoneButton(_ sender: UIButton) {
        let mainVC = presentingViewController as! MainViewController
        
        mainVC.EmotionTextBox.text = MoodLabel.text
        dismiss(animated: true, completion: nil)
        
    }
    
}

    

