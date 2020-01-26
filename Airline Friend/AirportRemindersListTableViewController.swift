//
//  RemindersListTableViewController.swift
//  Airline Friend
//
//  Created by Alexander Hall on 1/25/20.
//  Copyright © 2020 Hall Inc. All rights reserved.
//

import UIKit

class AirportRemindersListTableViewController: UITableViewController {

    // MARK: - Table view model
    var airportReminders = [AirportReminder]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let allAirportReminders = loadReminders() {
            airportReminders += allAirportReminders
        }
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.reloadData()
    }

    @IBAction func backButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airportReminders.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reminderCell", for: indexPath)
        cell.textLabel!.text = "." + airportReminders[indexPath.row].text
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            airportReminders.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveReminders()
        }
    }
    
    func saveReminders() {
        let fullPath = AirportReminder.DocumentsDirectory.appendingPathComponent("reminders")
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: airportReminders, requiringSecureCoding: false)
            try data.write(to: fullPath)
            
        } catch {
            print("Failed to save reminders")
        }
    }
    
    // gets all the reminders from the Documents Directory
    func loadReminders() -> [AirportReminder]? {
        let dataURL = AirportReminder.DocumentsDirectory.appendingPathComponent("reminders")
        guard let codedData = try? Data(contentsOf: dataURL) else {
            return nil
        }
        let data = try! (NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(codedData) as! [AirportReminder])
        
        return data
    }
    
    @IBAction func unwindToReminderTableVC(segue: UIStoryboardSegue) {
        if let addAirportReminderVC = segue.source as? AddAirportReminderVC, let airportReminder = addAirportReminderVC.airportReminder {
            // add a new airport reminder
            let newIndexPath = IndexPath(row: airportReminders.count, section: 0)
            airportReminders.append(airportReminder)
            tableView.insertRows(at: [newIndexPath] , with: .bottom)
            saveReminders()
            tableView.reloadData()
        }
    }

}
