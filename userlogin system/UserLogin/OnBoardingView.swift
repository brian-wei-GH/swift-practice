import SwiftUI

struct OnBoardingView: View {

    // Onboarding states:
    /*
     0: welcome screen
     1: add name
     2: add age
     3: add gender
     */
    @State private var onboardingState: Int = 0

    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing), removal: .move(edge: .leading))

    // onboarding inputs
    @State private var userName: String = ""
    @State private var age: Double = 25
    @State private var gender: String = ""

    // for alert
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""

    // app storage
    @AppStorage("name") private var currentUserName: String?
    @AppStorage("age") private var currentUserAge: Int?
    @AppStorage("gender") private var currentUserGender: String?
    @AppStorage("signed_in") private var currentUserSingIn: Bool = false

    var body: some View {
        ZStack {
            // content
            ZStack {
                switch onboardingState {
                case 0:
                    welcomeSection
                        .transition(transition)
                case 1:
                    addNameSection
                        .transition(transition)
                case 2:
                    addAgeSection
                        .transition(transition)
                case 3:
                    addGenderSection
                        .transition(transition)
                default:
                    defaultMessage
                }
            }

            // button
            VStack {
                Spacer()
                bottomButton
            }
            .padding()
        }
        .alert(
            isPresented: $showAlert,
            content: {
                return Alert(title: Text(alertTitle))
            })
    }
}

// MARK: Components
extension OnBoardingView {
    private var bottomButton: some View {
        Text(
            onboardingState == 0
                ? "Get Start" : onboardingState == 3 ? "Finish" : "Next"
        )
        .font(.headline)
        .foregroundStyle(.purple)
        .frame(height: 55)
        .frame(maxWidth: .infinity)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .onTapGesture {
            handleNextButtonPressed()
        }
    }

    private var welcomeSection: some View {
        VStack(spacing: 40) {
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text("Find your match.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .overlay(
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 5)
                        .foregroundStyle(.white), alignment: .bottom
                )
            Text(
                "this is the #1 app for finding your match online! In this tutorial we are practicing using AppStorage and other SwiftUI techniques."
            )
            .fontWeight(.medium)
            .foregroundStyle(.white)

            Spacer()
            Spacer()
        }
        .padding()
    }

    private var addNameSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What is your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            TextField("Your name here...", text: $userName)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                )

            Spacer()
            Spacer()
        }
        .padding()
    }

    private var addAgeSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What is your age?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            Text("\(String(format: "%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            Slider(value: $age, in: 18...100, step: 1)
                .tint(.white)

            Spacer()
            Spacer()
        }
        .padding()
    }

    private var addGenderSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What is your gender?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            Menu {
                Button("Male") {
                    gender = "Male"
                }
                Button("Female") {
                    gender = "Female"
                }
            } label: {
                Text(gender.isEmpty ? "Select your gender" : gender)
                    .font(.headline)
                    .foregroundColor(gender.isEmpty ? .gray : .primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 2)
                    .padding(.horizontal)
            }

            Text("Selected: \(gender)")
                .foregroundColor(.white)

            Spacer()
            Spacer()
        }
        .padding()
    }

    private var defaultMessage: some View {
        VStack {
            Text("Onboarding Complete!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            Text("Welcome, \(userName)!")
                .foregroundStyle(.white)
        }
    }
}

// MARK: Function
extension OnBoardingView {

    func handleNextButtonPressed() {

        switch onboardingState {
        case 1:
            guard userName.count >= 3 else {
                alertTitle = "Write your name"
                showAlert = true
                return
            }
        case 3:
            guard gender.count > 1 else {
                alertTitle = "Select your gender"
                showAlert = true
                return
            }
        default:
            break
        }

        if onboardingState == 3 {
            // sign in
            SignIn()

        } else {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                onboardingState += 1
            }

        }
    }

    func SignIn() {
        currentUserName = userName
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
            currentUserSingIn = true
        }
    }
}

#Preview {
    OnBoardingView()
        .background(.purple)
}
