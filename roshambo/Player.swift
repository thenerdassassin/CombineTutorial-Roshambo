import Combine

class Player: ObservableObject {
  @Published var element = Element.none
  private var cancellableSet: Set<AnyCancellable> = []
  
  init(_ resetter: AnyPublisher<Bool, Never>) {
    resetter.sink {
      self.element = $0 ? .none : self.element
    }.store(in: &cancellableSet)
  }
}
