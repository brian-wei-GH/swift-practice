//
//  List.swift
//  ToDoList
//
//  Created by 黃騰威 on 3/31/25.
//

import SwiftUI

struct ListView: View {

    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.editMode) var editMode

    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                guard editMode?.wrappedValue != .active else {
                                    return
                                }
                                listViewModel.updateItem(item: item)

                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)

                }
                .environment(\.editMode, editMode)

            }
        }
        .navigationTitle("Todo List")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                   Button(editMode?.wrappedValue == .active ? "Done" : "Edit") {
                       withAnimation {
                           editMode?.wrappedValue = editMode?.wrappedValue == .active ? .inactive : .active
                       }
                   }
               }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                }
            }

        }

    }

}

#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(ListViewModel())
}
