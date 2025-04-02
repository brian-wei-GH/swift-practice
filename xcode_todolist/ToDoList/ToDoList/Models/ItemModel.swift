//
//  Costom.swift
//  ToDoList
//
//  Created by 黃騰威 on 3/31/25.
//

import Foundation

// Database
struct ItemModel: Identifiable, Codable {
    let id: UUID
    var title: String
    var isCompleted: Bool
    
    init(id: UUID = UUID(), title: String, isCompleted: Bool) {
            self.id = id
            self.title = title
            self.isCompleted = isCompleted
        }
}
