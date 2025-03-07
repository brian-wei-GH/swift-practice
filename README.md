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
