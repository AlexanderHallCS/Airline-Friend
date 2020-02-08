//
//  AddAirportReminderVC.swift
//  Airline Friend
//
//  Created by Alexander Hall on 1/25/20.
//  Copyright © 2020 Hall Inc. All rights reserved.
//

import Foundation
import UIKit

class AddAirportReminderVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet var reminderTextField: UITextField!
    
    var airportReminder: AirportReminder?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reminderTextField.delegate = self
        
        saveButton.isEnabled = false
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        reminderTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        saveButton.isEnabled = !reminderTextField.text!.isEmpty
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender as? UIBarButtonItem == saveButton{
            airportReminder = AirportReminder(text: reminderTextField.text!)
            if let remindersVC = segue.destination as? AirportRemindersListTableViewController {
                remindersVC.tableView.reloadData()
            }
        }
    }
    
}
