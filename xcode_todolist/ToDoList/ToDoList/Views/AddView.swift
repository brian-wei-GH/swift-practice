//
//  AddView.swift
//  ToDoList
//
//  Created by 黃騰威 on 3/31/25.
//

import SwiftUI

struct AddView: View {

    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var textFieldText: String = ""
    
    @State private var alertTitle: String = ""
    @State private var showAlert: Bool = false

    var body: some View {
        ScrollView {
            VStack {
                TextField("Type somethin here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(
                        Color(UIColor.systemGray4)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }

            }
            .padding(15)
        }
        .navigationTitle("Add an Item")
        .alert(alertTitle, isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        }
    }

    func saveButtonPressed() {

        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
    }

    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!!! 😱😰😭"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    
}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModel())
}
