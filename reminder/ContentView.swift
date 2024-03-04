//
//  ContentView.swift
//  reminder
//
//  Created by Mickson Bossman on 28.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isDrawerVisible = false

    var body: some View {
        NavigationView {
            ReminderListView(isDrawerVisible: $isDrawerVisible, viewModel: ReminderViewModel())
        }
    }
}

#Preview {
    ContentView()
}
