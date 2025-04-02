//
//  NoItemsView.swift
//  ToDoList
//
//  Created by 黃騰威 on 4/1/25.
//

import SwiftUI

struct NoItemsView: View {
    
    @State private var animate = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("No Items")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Great, Let's creating some items to your todo list")
                
                NavigationLink(destination: AddView(), label: {Text("Press me to add something")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.red : Color.blue)
                        .clipShape(RoundedRectangle (cornerRadius: 10))
                })
                .padding(.horizontal, animate ? 30 : 50)
            }
            .multilineTextAlignment(.center)
            .padding(30)
            .onAppear {
                startAnimation()
            }
        }
    }
    func startAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(
                .easeInOut(duration: 2.0)
                .repeatForever()
            ) {
                animate = true
            }
        }
    }
}

#Preview {
    NoItemsView()
}
