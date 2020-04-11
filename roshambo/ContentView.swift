import SwiftUI

struct ContentView: View {
  @EnvironmentObject var app: App
  
  var body: some View {
    VStack {
      Text("Player One")
        .font(.title)
        .padding()
      ChooseElementView(selectedElement: $app.user.element)
        .disabled(app.winner != nil)
        .opacity(app.user.element != Element.none ? 0.5 : 1)
      Text(app.playerTwo.element == Element.none ? "" : "Selected")
        .padding()
      control
      Text(app.playerTwo.element == Element.none ? "" : "Selected")
        .padding()
      ChooseElementView(selectedElement: $app.playerTwo.element)
        .disabled(true)
        .opacity(app.playerTwo.element != Element.none ? 0.5 : 1)
      Text("Player Two")
        .font(.title)
        .padding()
    }
  }
  
  var control: some View {
    if let _ = app.winner {
      return HStack {
        Text(message)
          .padding()
        Button(action: app.reset) {
          Text("Reset")
            .padding()
        }
      }
      .eraseToAnyView()
    } else {
      return Text(message)
        .eraseToAnyView()
    }
  }
  
  var message: String {
    let winner = app.winner
    switch winner {
    case .one: return "Player one wins"
    case .two: return "Player two wins"
    case .neither: return "Tie!"
    case .none: return "Make a choice"
    }
  }
}
