import SwiftUI

struct ChooseElementView: View {
  @Binding var selectedElement: Element
  
  var body: some View {
    VStack(spacing: 5) {
      ForEach(Element.allItems, id: \.self) { element in
        RoshamboButton(element: element) {
          self.selectedElement = element
        }
      }
    }
  }
}
