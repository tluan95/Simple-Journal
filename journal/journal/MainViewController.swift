//
//  MianViewController.swift
//  journal
//
//  Created by WONG TED LUAN on 28/07/2021.
//  Copyright © 2021 WONG TED LUAN. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var DateTextBox: UITextField!
    @IBOutlet weak var EmotionTextBox: UITextField!
    @IBOutlet weak var DescriptionTextView: UITextView!
    @IBOutlet weak var SaveButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func PressedDateTextBox(_ sender: UITextField) {
        performSegue(withIdentifier: "goDatePage", sender: self)
    }
    @IBAction func PressedEmotionTextBox(_ sender: UITextField) {
        performSegue(withIdentifier: "goEmotionPage", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goDatePage"{
            _ = segue.destination as! DateViewController
            
        }else {
            _ = segue.destination as! EmotionPickerViewController
            
        }
    }
    
    
    @IBAction func PressedSaveButton(_ sender: UIButton) {
        // create alert message
        let alertMsg = UIAlertController(
            title:"Journal Saved !",
            message:"Your journal have been saved",
            preferredStyle:UIAlertController.Style.alert)
        
        // create alert action
        let cancelAction = UIAlertAction(
            title:"Continue",
            style:UIAlertAction.Style.cancel,
            handler:nil)
        
        // add the UIAction to the UIAlertController
        alertMsg.addAction(cancelAction)
        
        // present or display the alert
        self.present(alertMsg, animated: true, completion:nil)
        
        DateTextBox.text = ""
        EmotionTextBox.text = ""
        DescriptionTextView.text = ""
        
        
    }
    
    


}
