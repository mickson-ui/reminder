//
//  ReminderViewModel.swift
//  reminder
//
//  Created by Mickson Bossman on 29.02.2024.
//

import Foundation

class ReminderViewModel: ObservableObject{
    @Published var reminders: [Reminder] = []
    
    init(){
        reminders.append(Reminder(title: "Test Reminder", description: "Test Description", date: Date()))
        loadData()
    }
    
    private var fileURL: URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let userReminderURL = documentsDirectory.appendingPathComponent("reminders.json")
        return userReminderURL
    }
    
    func saveData(){
        let encoder = JSONEncoder()
        let data = try? encoder.encode(reminders)
        do{
            try data!.write(to: fileURL)
            print("Data saved successfully")
        }catch{
            print("Error saving data: ", error)
        }
    }
    
    func loadData() {
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: fileURL.path) {
            do {
                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                reminders = try decoder.decode([Reminder].self, from: data)
                print("Data loaded successfully: \(reminders)")
            } catch {
                print("Error loading data:", error)
            }
        }
    }

    
    
    
    func addReminder(_ reminder: Reminder){
        reminders.append(reminder)
        saveData()
        print("Reminder added:", reminder)
    }

    func updateReminder(_ updateReminder: Reminder){
        if let index = reminders.firstIndex(where: {$0.id == updateReminder.id}){
            reminders[index] = updateReminder
            saveData()
            print("Reminder updated: ", updateReminder)
        }
    }
    
    
//    func deleteReminder(_ reminder: Reminder){
//        reminders.removeAll{$0.id == reminder.id}
//    }
    
    
    
}
