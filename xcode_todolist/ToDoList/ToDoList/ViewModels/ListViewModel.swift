//
//  ListViewModel.swift
//  ToDoList
//
//  Created by 黃騰威 on 4/1/25.
//

import Foundation

/*
 Functions:
 
 1. delete item
 2. move item
 3. add item
 4. update item
 5. save item // convert to JSON
 
 */

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItem()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
//        let newItems = [
//            ItemModel(title: "this is the first title", isCompleted: false),
//            ItemModel(title: "this is the second title", isCompleted: true),
//            ItemModel(title: "this is the third title", isCompleted: false)
//        ]
//        items.append(contentsOf: newItems)
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index].isCompleted.toggle()
        }
    }
    
    func saveItem() {
        if let encodedDate = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedDate, forKey: itemsKey)
        }
    }
}
