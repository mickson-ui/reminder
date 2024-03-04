//
//  ReminderModel.swift
//  reminder
//
//  Created by Mickson Bossman on 28.02.2024.
//

import Foundation

struct Reminder: Identifiable, Codable{
    var id = UUID()
    var title: String
    var description: String
    var date: Date
    
    init(title: String, description: String, date: Date) {
        self.title = title
        self.description = description
        self.date = date
    }
}
