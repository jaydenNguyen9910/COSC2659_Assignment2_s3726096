
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

struct ButtonModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 25, weight: .heavy, design: .rounded))
            .background(
                Capsule().fill(LinearGradient(gradient: Gradient(colors: [ColorConstants.darkGreen, ColorConstants.yellow]), startPoint: .bottom, endPoint: .top))
                    .frame(width: 100, height: 50, alignment: .center)
            )
    }
}

struct scoreCapsuleStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(
                Capsule()
                    .foregroundColor(ColorConstants.darkGreen))
    }
}
