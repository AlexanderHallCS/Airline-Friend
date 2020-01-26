//
//  AirportReminder.swift
//  Airline Friend
//
//  Created by Alexander Hall on 1/25/20.
//  Copyright © 2020 Hall Inc. All rights reserved.
//

import Foundation

class AirportReminder: NSObject, NSCoding {
    
    var text: String
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("reminders")
    
    struct PropertyKey {
        static let textKey = "text"
    }
    
    init(text: String) {
        self.text = text
        super.init()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(text, forKey: PropertyKey.textKey)
    }
    
    required convenience init?(coder: NSCoder) {
        let text = coder.decodeObject(forKey: PropertyKey.textKey) as! String
        self.init(text: text)
    }
}
