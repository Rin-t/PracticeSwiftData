//
//  TodoWithSwiftDataApp.swift
//  TodoWithSwiftData
//
//  Created by Rin on 2023/09/02.
//

import SwiftUI
import SwiftData

@main
struct TodoWithSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Todo.self)
        }
    }
}
