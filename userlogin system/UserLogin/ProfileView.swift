import SwiftUI

struct ProfileView: View {
    
    @AppStorage("name") private var currentUserName: String?
    @AppStorage("age") private var currentUserAge: Int?
    @AppStorage("gender") private var currentUserGender: String?
    @AppStorage("signed_in") private var currentUserSingIn: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            Text(currentUserName ?? "Username")
            Text("User's age is \(currentUserAge ?? 0) years old")
            Text("User's gender is \(currentUserGender ?? "Unknown")")
            
            // sign out button
            Text("Sign Out")
                .foregroundStyle(.white)
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                )
                .onTapGesture {
                    signOut()
                }
        }
        .font(.title3)
        .padding()
    }
    func signOut() {
        currentUserName = nil
        currentUserAge = nil
        currentUserGender = nil
        withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
            currentUserSingIn = false
        }
    }
}

#Preview {
    ProfileView()
}
