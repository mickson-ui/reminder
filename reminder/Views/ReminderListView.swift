//
//  ReminderListView.swift
//  reminder
//
//  Created by Mickson Bossman on 28.02.2024.
//

import SwiftUI

struct ReminderListView: View {
    @Binding var isDrawerVisible: Bool
    @ObservedObject var viewModel: ReminderViewModel
    
    var body: some View {
        VStack{
            Button("Add Reminder"){
                isDrawerVisible.toggle()
            }
            .padding()
            
            List(viewModel.reminders){ reminder in
                VStack(alignment: .leading){
                    Text(reminder.title)
                        .font(.headline)
                    Text(reminder.description)
                        .font(.subheadline)
                    Text("Date: \(formattedDate(reminder.date))")
                        .font(.caption)
                }
            }
            .navigationTitle("Reminders")
        }
        .sheet(isPresented: $isDrawerVisible){
            ReminderDrawer()
        }
        .onAppear{
            viewModel.loadData()
        }
    }
}

func formattedDate(_ date: Date)->String{
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM d, yyyy h:mm a"
    return formatter.string(from: date)
}


#Preview {
    NavigationView {
        ReminderListView(isDrawerVisible: .constant(false), viewModel: ReminderViewModel())
    }
}
