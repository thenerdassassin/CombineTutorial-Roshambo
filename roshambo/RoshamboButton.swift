import SwiftUI

struct RoshamboButton: View {
  var element: Element
  var action: () -> ()
  
  var body: some View {
    Button(action: action) {
      Text(element.title)
        .font(.title)
        .padding(.horizontal, 40)
        .padding(.vertical, 20)
        .background(element.color)
        .foregroundColor(Color.white)
        .cornerRadius(40)
        .overlay(
          RoundedRectangle(cornerRadius: 40)
            .stroke(Color.black, lineWidth: 3)
      )
    }
  }
}
