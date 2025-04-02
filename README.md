# swift-practice
## 🔆 rock-paper-scissors betting game
This SwiftUI view implements a rock-paper-scissors betting game. Players can bet an amount of money, select their move (scissors, paper, or rock), and compete against a randomly selected choice from the "banker". The outcome determines whether the player wins, loses, or draws, updating their money accordingly.

- Displays Current Money

The user's balance is shown at the top, alongside a button (+100) to add money.

- Allows Betting Using a Slider 

A slider lets the user select how much money to bet (ranging from 0 to Money).
The selected bet amount is displayed before confirming the bet.
User Can Select Rock, Paper, or Scissors ✊ ✋ ✌️

- Buttons allow the user to choose one of the three options.
When a button is clicked, a random choice is selected for the banker.
The winner is determined based on standard rock-paper-scissors rules.

- Displays Results 

The player’s choice and banker’s choice are shown on the screen.
The result (Win, Lose, or Draw) is displayed dynamically with different colors:

Red for Win 🏆

Green for Lose ❌

White for Draw 🤝

- Money is Updated Based on Outcome 

If the player wins, they get double the bet amount.
If they lose, they lose their bet.
If it's a draw, they get their bet back.


## 🔆 User Login System
This SwiftUI-based user login system implements a simple onboarding and profile experience using @AppStorage for data persistence. When the app launches, it presents the IntroView, which checks whether the user is signed in by reading the signed_in flag from @AppStorage. If the user is not signed in, the OnBoardingView is shown, guiding the user through a multi-step onboarding process where they provide their name, age, and gender. Each step includes input validation and smooth transitions to enhance the user experience. Once the user completes the onboarding process and submits their information, it is stored persistently using @AppStorage, and the signed_in flag is set to true. This triggers the view to switch to ProfileView, which displays the saved user information and provides a "Sign Out" option. Signing out clears the stored data and resets the signed_in flag to false, returning the user to the onboarding flow. This system ensures a seamless and persistent login experience without relying on external authentication services.

initial view: IntroView --> OnBoardingView or ProfileView

- step:
  1. welcome screen
  2. add name
  3. add age
  4. add gender

- log out:

  5. log out

## 🔆 ToDo List 
A beautifully minimal and functional ToDo List app built using **SwiftUI** and the **MVVM architecture**. It allows users to add, delete, reorder, and mark tasks as complete — with persistent local storage using `UserDefaults`.

- ✅ Add new tasks
- 🗑️ Delete tasks with swipe
- ☑️ Mark tasks as complete/incomplete
- 📥 Persist data with `UserDefaults`
- 🔀 Reorder tasks with drag-and-drop
- 🧼 Clean and modern UI using SwiftUI
- 💡 Light/Dark Mode support

### Tech Stack
1. SwiftUI
2. MVVM architecture
3. Xcode 15+, IOS 17+


  
