import SwiftUI

struct ContentView: View {
  @EnvironmentObject var app: App
  
  var body: some View {
    VStack {
      Text("Player One")
        .font(.title)
        .padding()
      ChooseElementView(selectedElement: $app.playerOneElement)
        .disabled(app.hasWinner)
        .opacity(app.playerOneElement != nil ? 0.5 : 1)
      Text(app.playerOneElement == nil ? "" : "Selected")
        .padding()
      Spacer()
      control
      Spacer()
      Text(app.playerTwoElement == nil ? "" : "Selected")
        .padding()
      ChooseElementView(selectedElement: $app.playerTwoElement)
        .disabled(app.hasWinner)
        .opacity(app.playerTwoElement != nil ? 0.5 : 1)
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
    case .neither: return "You suck"
    case .none: return "Make a choice"
    }
  }
}
