import Combine

enum Winner {
  case one, two, neither
}

class Game: ObservableObject {
  @Published var winner: Winner?
  private var cancellableSet: Set<AnyCancellable> = []
  
  init(playerOneElement: AnyPublisher<Element, Never>,
       playerTwoElement: AnyPublisher<Element, Never>) {
    let _ = Publishers.CombineLatest(playerOneElement, playerTwoElement)
      .map { self.getWinner(elementOne: $0, elementTwo: $1)}
      .assign(to: \.winner, on: self)
      .store(in: &cancellableSet)
  }
  
  func getWinner(elementOne: Element, elementTwo: Element) -> Winner? {
    let result = battle(elementOne: elementTwo, elementTwo: elementTwo)
    switch result {
    case .win: return .one
    case .lose: return .two
    case .tie: return .neither
    default: return nil
    }
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
