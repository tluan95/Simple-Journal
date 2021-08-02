//
//  ViewController.swift
//  journal
//
//  Created by WONG TED LUAN on 26/07/2021.
//  Copyright © 2021 WONG TED LUAN. All rights reserved.
//

import UIKit


class DateViewController: UIViewController {
    
    @IBOutlet weak var DateTextField: UITextField!
    @IBOutlet weak var DoneButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up date picker function
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        //Toggle date picker
        datePicker.addTarget(self, action: #selector(dateChange(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.maximumDate = Date()
        
        //show selected date
        DateTextField.inputView = datePicker
        DateTextField.text = formatDate(date: datePicker.date)
        
    }
    @objc func dateChange (datePicker : UIDatePicker)
    {
       DateTextField.text = formatDate(date: datePicker.date)
    }
    
    //change date format
    func formatDate(date: Date ) -> String?
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd yyyy"
        return formatter.string(from: date)
    }
    
    //pass the date back to mainVC
    @IBAction func PressedDoneButton(_ sender: UIButton) {
        
        let mainVC = presentingViewController as! MainViewController
        
        mainVC.DateTextBox.text = DateTextField.text
        dismiss(animated: true, completion: nil)
    }
    

}

