//
//  ContentView.swift
//  TodoWithSwiftData
//
//  Created by Rin on 2023/09/02.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var todos: [Todo]

    @State private var textFieldInput = ""

    var body: some View {
        VStack {
            TextField("todo", text: $textFieldInput)
                .padding(8)
                .border(.gray, width: 1)
                .frame(width: 240)

            HStack {
                Button(action: {
                    add(todo: textFieldInput)
                    textFieldInput = ""
                }, label: {
                    Text("add")
                })
                .padding(.trailing, 24)

                Button(action: {
                    update()
                }, label: {
                    Text("done")
                })
            }
            .padding(.top, 12)


            Spacer()

            List {
                ForEach(todos) { todo in
                    HStack {
                        Image(systemName: "checkmark.seal.fill")
                            .opacity(todo.isDone ? 1.0 : 0)
                        Text("やること: \(todo.content)")
                            .padding(.trailing, 8)
                        Text("登録時間: \(todo.registerDate)")
                    }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        delete(todo: todos[index])
                    }
                })
            }
        }
    }

    private func add(todo: String) {
        let data = Todo(content: todo)
        context.insert(data)
    }

    private func delete(todo: Todo) {
        context.delete(todo)
    }

    private func update() {
        let updatingTodoIndex = todos.firstIndex { !$0.isDone }
        guard let updatingTodoIndex else { return }
        todos[updatingTodoIndex].isDone = true
        try? context.save()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Todo.self)
}
