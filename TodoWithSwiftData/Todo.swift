//
//  Todo.swift
//  TodoWithSwiftData
//
//  Created by Rin on 2023/09/02.
//

import Foundation
import SwiftData

@Model
final class Todo {
    var content: String
    var isDone: Bool
    let registerDate: Date

    init(content: String) {
        self.content = content
        isDone = false
        registerDate = Date()
    }
}
