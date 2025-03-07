import SwiftUI

struct NewViewGM: View {

    @State private var BackgroundColor: Color = .blue
    @State private var UserSelection: String = ""
    @State private var RandomSelection: String = ""
    @State private var Money: Int = 1000
    @State private var BetAmount: Double = 0
    @State private var BetDecision: Bool = false
    @State private var BetResult: String = ""

    let choices = ["scissors", "paper", "rock"]

    var body: some View {
        ZStack {
            BackgroundColor
                .ignoresSafeArea()

            VStack {
                VStack {
                    Text("Money Game!")
                        .font(.largeTitle)
                        .foregroundStyle(.yellow)
                        .padding(20)
                    HStack {
                        Image(systemName: "dollarsign.bank.building")
                            .symbolRenderingMode(.hierarchical)
                            .font(.title)
                            .foregroundStyle(.yellow)

                        Text("\(Money)")
                            .font(.title)
                            .foregroundStyle(
                                Color(
                                    hue: 0.14, saturation: 0.859,
                                    brightness: 0.941))
                        Button(
                            action: {
                                Money += 100
                            },
                            label: {
                                Image(systemName: "plus.app")
                                    .symbolRenderingMode(.hierarchical)
                                    .font(.title)
                                    .foregroundStyle(.black)
                            })

                    }
                    .padding()
                    Text("Bet: \(BetAmount, specifier: "%.0f")")
                        .font(.title)
                        .foregroundStyle(
                            Color(
                                hue: 0.14, saturation: 0.859, brightness: 0.941)
                        )
                }

                Spacer()

                HStack(spacing: 20) {

                    // scissors button
                    gameButton(imageName: "scissors", selection: "scissors")

                    // paper button
                    gameButton(
                        imageName: "hand.raised.fingers.spread.fill",
                        selection: "paper")

                    // rock button
                    gameButton(imageName: "tennisball.fill", selection: "rock")
                }
                .padding()

                // display user selection
                Text("You selected: \(UserSelection)")
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding()

                // display random selection
                Text("Banker selected: \(RandomSelection)")
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding()

                Text("Bet result: \(BetResult)")
                    .font(.title)
                    .foregroundStyle(betResultColor())
                    

                Spacer()

                HStack {
                    Text("0")
                    Slider(value: $BetAmount, in: 0...Double(Money), step: 1)
                        .tint(.yellow)
                    Text("\(Money)")
                }
                .padding(.horizontal)

                Button(
                    action: {
                        if BetAmount < Double(Money) {
                            Money -= Int(BetAmount)
                        }
                        BetDecision = true
                    },
                    label: {
                        Text("\(BetAmount, specifier: "%.0f")")
                            .font(.title3)
                            .foregroundStyle(.yellow)
                            .padding()
                            .padding(.horizontal, 25)
                            .background(
                                Capsule()
                                    .stroke(Color.yellow, lineWidth: 2.0)
                            )
                    })

                Spacer()
            }
        }

    }
    // function for game button
    func gameButton(imageName: String, selection: String) -> some View {
        Button(
            action: {
                if BetDecision {
                    UserSelection = selection
                    RandomSelection = choices.randomElement() ?? ""

                    // determine winner
                    let result = checkWinner(user: UserSelection, banker: RandomSelection)
                    if result == "Win"{
                        Money += Int(BetAmount * 2)
                        BetResult = "You Win!"
                    } else if result == "Lose" {
                        BetResult = "You Lose!"
                    } else {
                        BetResult = "Draw!"
                        Money += Int(BetAmount)
                    }
                }

                BetDecision = false
            },
            label: {
                Image(systemName: imageName)
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.white)
                    .frame(width: 50, height: 50)
                    .background(.red)
                    .clipShape(Circle())
            })
    }
    
    // function for check paper, scissors, rock
    func checkWinner(user: String, banker: String) -> String {
        if user == banker {
            return "Draw"
        }
        
        if (user == "scissors" && banker == "paper") ||
           (user == "paper" && banker == "rock") ||
           (user == "rock" && banker == "scissors") {
            return "Win"
        } else {
            return "Lose"
        }
    }
    
    // dynamic show color
    func betResultColor() -> Color {
        switch BetResult {
        case "You Win!":
            return .red
        case "You Lose!":
            return .green
        case "Draw!":
            return .white
        default:
            return .white
        }
    }
    

}

#Preview {
    NewViewGM()
}
