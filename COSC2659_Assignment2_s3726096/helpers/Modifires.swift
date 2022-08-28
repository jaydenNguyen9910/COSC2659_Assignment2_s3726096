
import SwiftUI

struct cardModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .frame(width: 100, height: 180)
      .overlay {
          Rectangle().stroke(Color.black, lineWidth: 1)
      }
  }
}
