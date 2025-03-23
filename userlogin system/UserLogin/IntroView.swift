import SwiftUI

struct IntroView: View {
    
    @AppStorage("signed_in") private var currentUserSingIn: Bool = false
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [.purple, .blue]),
                center: .topLeading,
                startRadius: 15,
                endRadius: 800
            )
            .ignoresSafeArea()
            if currentUserSingIn {
                ProfileView()
            } else {
                OnBoardingView()
            }
        }
    }
}

#Preview {
    IntroView()
}
