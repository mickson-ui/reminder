//
//  ReminderDrawer.swift
//  reminder
//
//  Created by Mickson Bossman on 28.02.2024.
//

import SwiftUI

struct ReminderDrawer: View {
    @State private var title = ""
    @State private var description = ""
    @State private var date = Date()
    @State private var isDrawerVisible = true
    
    var body: some View {
        NavigationView{
            ReminderDrawerForm(
                title: $title,
                description: $description,
                date: $date,
                viewModel: ReminderViewModel()
            )
            .navigationTitle("Add Reminder")
        }
    }
}

struct ReminderDrawerForm: View{
    @Binding var title: String
    @Binding var description: String
    @Binding var date: Date
    @ObservedObject var viewModel: ReminderViewModel
    
    
    var body: some View{
        
        VStack{
            Form{
                Section{
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                    DatePicker("Date", selection: $date, in: Date()...)
                }
            }
            Button(action: {
                let newReminder = Reminder(title: title, description: description, date: date)
                viewModel.addReminder(newReminder)
            }){
                Text("Save Reminder")
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(5)
            }
            .padding()
        }
    }
}

#Preview {
    ReminderDrawer()
}

