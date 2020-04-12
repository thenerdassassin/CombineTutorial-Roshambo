import SwiftUI

struct RoshamboButton: View {
  var element: Element
  var action: () -> ()
  
  var body: some View {
    Button(action: action) {
      Text(element.title)
        .font(.title)
        .padding(.horizontal, 30)
        .padding(.vertical, 15)
        .background(element.color)
        .foregroundColor(Color.white)
        .cornerRadius(40)
        .overlay(
          RoundedRectangle(cornerRadius: 30)
            .stroke(Color.black, lineWidth: 3)
      )
    }
  }
}
