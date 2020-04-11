import SwiftUI
import Combine

enum Winner {
  case one, two, neither
}

class App: ObservableObject {
  @Published var user: Player
  @Published var playerTwo: CopyCatPlayer! = nil
  @Published var winner: Winner?
  private var cancellableSet: Set<AnyCancellable> = []
  
  init() {
    self.user = Player()
    self.playerTwo = CopyCatPlayer(opponentElementPublisher: user.$element.eraseToAnyPublisher())
    let _ = Publishers.CombineLatest(user.$element, playerTwo.$element)
      .map { self.getWinner(elementOne: $0, elementTwo: $1)}
      .eraseToAnyPublisher()
      .assign(to: \.winner, on: self)
      .store(in: &cancellableSet)
  }
  
  var hasWinner: Bool { winner != nil }
  
  func getWinner(elementOne: Element, elementTwo: Element) -> Winner? {
    let result = battle(elementOne: elementTwo, elementTwo: elementTwo)
    switch result {
    case .win: return .one
    case .lose: return .two
    case .tie: return .neither
    default: return nil
    }
  }
  
  func reset() {
    print("Resetting")
    user.element = .none
    playerTwo.element = .none
  }
  
  func battle(elementOne: Element, elementTwo: Element) -> BattleResult? {
    if elementOne == .none || elementTwo == .none {
      return nil
    }
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
    return nil
  }
  
}
