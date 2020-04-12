import SwiftUI
import Combine

class CopyCatPlayer: Player {
  private var cancellableSet: Set<AnyCancellable> = []
  
  init(opponentElement: AnyPublisher<Element, Never>, _ resetter: AnyPublisher<Bool, Never>) {
    super.init(resetter)
    let _ = opponentElement
      .debounce(for: .milliseconds(200), scheduler: RunLoop.main)
      .receive(on: RunLoop.main)
      .assign(to: \.element, on: self)
      .store(in: &cancellableSet)
  }
}
