import SwiftUI

struct ContentView: View {
  @EnvironmentObject var app: App
  
  var body: some View {
    VStack {
      Spacer()
      Text("Player One")
        .font(.title)
        .padding()
      ChooseElementView(selectedElement: $app.user.element)
        .disabled(app.winner != nil)
        .opacity(app.user.element != Element.none ? 0.5 : 1)
      Text(app.user.element == Element.none ? "" : "Selected \(app.user.element.title)")
        .padding()
      control
      Text(app.opponent.element == Element.none ? "" : "Selected \(app.opponent.element.title)")
        .padding()
      ChooseElementView(selectedElement: $app.opponent.element)
        .disabled(true)
        .opacity(app.opponent.element != Element.none ? 0.5 : 1)
      Text("Opponent")
        .font(.title)
        .padding()
      Spacer()
    }
  }
  
  var control: some View {
    if let _ = app.winner {
      return HStack {
        Text(message)
        Button(action: app.reset) {
          Text("Reset")
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
    case .two: return "Opponent wins"
    case .neither: return "Tie!"
    case .none: return "Make a choice"
    }
  }
}
