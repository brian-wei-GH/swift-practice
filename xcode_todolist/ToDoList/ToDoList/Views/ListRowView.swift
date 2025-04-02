//
//  ListRowView.swift
//  ToDoList
//
//  Created by 黃騰威 on 3/31/25.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle": "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 6)
    }
}

private let item1 = ItemModel(title: "first item", isCompleted: false)

#Preview {
    ListRowView(item: item1)
}
