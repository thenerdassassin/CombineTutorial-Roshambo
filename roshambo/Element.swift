import SwiftUI

enum BattleResult {
  case win, lose, tie
}

enum Element {
  case water, fire, grass, none
  
  var title: String {
    switch self {
    case .water: return "Water"
    case .fire: return "Fire"
    case .grass: return "Grass"
    case .none: return ""
    }
  }
  var color: Color {
    switch self {
    case .water: return .blue
    case .fire: return .red
    case .grass: return .green
    case .none: return .clear
    }
  }
  static let allItems: [Element] = [.water, .fire, .grass]
  
}
