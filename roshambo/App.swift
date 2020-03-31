import SwiftUI

enum Winner {
  case one, two, neither
}

class App: ObservableObject {
  @Published var playerOneElement: Element?
  @Published var playerTwoElement: Element?
  var hasWinner: Bool { winner != nil }
  
  var winner: Winner? {
    guard
      let playerOneElement = playerOneElement,
      let playerTwoElement = playerTwoElement else {
        return nil
    }
    
    let result = battle(elementOne: playerOneElement, elementTwo: playerTwoElement)
    switch result {
    case .win: return .one
    case .lose: return .two
    case .tie: return .neither
    }
  }
  
  func reset() {
    playerOneElement = nil
    playerTwoElement = nil
  }
  
  private func battle(elementOne: Element, elementTwo: Element) -> BattleResult {
    if elementOne == elementTwo {
      return .tie
    }
    if elementOne == .water {
      return elementTwo == .fire ? .win : .lose
    }
    if elementOne == .fire {
      return elementTwo == .grass ? .win : .lose
    }
    if elementOne == .grass {
      return elementTwo == .water ? .win : .lose
    }
    return .tie
  }
  
}
