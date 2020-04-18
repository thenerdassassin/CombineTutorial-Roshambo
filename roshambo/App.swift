import Combine

class App: ObservableObject {
  @Published var user: Player
  @Published var opponent: CopyCatPlayer! = nil
  @Published var winner: Winner?
  
  let resetPublisher = PassthroughSubject<Bool, Never>()
  
  private var game: Game?
  private var cancellableSet: Set<AnyCancellable> = []
  
  init() {
    self.user = Player(resetPublisher.eraseToAnyPublisher())
    self.opponent = CopyCatPlayer(
      opponentElement: user.$element.eraseToAnyPublisher(),
      resetPublisher.eraseToAnyPublisher())
    self.game = Game(playerOneElement: user.$element.eraseToAnyPublisher(),
                     playerTwoElement: opponent!.$element.eraseToAnyPublisher())
    
    game!.$winner.assign(to: \.winner, on: self).store(in: &cancellableSet)
  }
  
  func reset() {
    resetPublisher.send(true)
  }
}
