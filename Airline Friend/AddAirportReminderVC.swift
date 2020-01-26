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
    
    var airportReminder: AirportReminder?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
    }
    
    
    @IBOutlet weak var reminderTextField: UITextField! {
        didSet {
            reminderTextField.delegate = self
        }
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
