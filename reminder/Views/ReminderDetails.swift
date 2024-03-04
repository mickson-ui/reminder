//
//  ReminderDetails.swift
//  reminder
//
//  Created by Mickson Bossman on 28.02.2024.
//

import SwiftUI

struct ReminderDetails: View {
    @State private var title: String
    @State private var description: String
    @State private var date: Date

    var onSave: (Reminder) -> Void

    init(reminder: Reminder, onSave: @escaping (Reminder) -> Void) {
        self._title = State(initialValue: reminder.title)
        self._description = State(initialValue: reminder.description)
        self._date = State(initialValue: reminder.date)
        self.onSave = onSave
    }

    var body: some View {
        ReminderDetailForm(
            title: $title,
            description: $description,
            date: $date,
            viewModel: ReminderViewModel()
        )
            .navigationTitle("Edit Reminder")
    }
}

struct ReminderDetailForm: View {
    @Binding var title: String
    @Binding var description: String
    @Binding var date: Date
    
    @ObservedObject var viewModel: ReminderViewModel
    
    var body: some View {
        Form{
            Section {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
                DatePicker("Date", selection: $date, in: Date()...)
            }

            Section {
                Button("Save Changes") {
                    let updatedReminder = Reminder(title: title, description: description, date: date)
                    viewModel.updateReminder(updatedReminder)
                }
            }
        }
    }
}

#Preview {
    ReminderDetails(reminder: 
                        Reminder(title: "Sample Title", description: "Sample Description", date: Date()), 
                    onSave: { _ in })
}

