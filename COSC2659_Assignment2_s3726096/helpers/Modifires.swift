
import SwiftUI

struct cardModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .frame(width: 90, height: 150)
      .overlay {
          RoundedRectangle(cornerRadius: 2).stroke(Color.black, lineWidth: 1)
      }
      .background(RoundedRectangle(cornerRadius: 2).fill(Color.white))
  }
}

struct scoreCapsuleStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color("button-background"), lineWidth: 1)
            ).background(RoundedRectangle(cornerRadius: 40).fill(Color("button-background")))
    }
}

struct textModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color("text-color"))
    }
}

struct buttonModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(.vertical,10)
            .padding(.horizontal, 20)
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color("button-background"), lineWidth: 1)
            ).background(RoundedRectangle(cornerRadius: 40).fill(Color("button-background")))
    }
}

struct humanIconModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 15)
            .padding(.horizontal, 15)
            .overlay(
                Circle().stroke(Color("button-background"), lineWidth: 1)
            ).background(Circle().fill(Color("button-background")))
    }
}

struct casinoChipModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(height: 30)
    }
}

struct textFieldModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(.vertical,10)
            .padding(.horizontal, 20)
            .frame(width: 200, height: 30, alignment: .center)
            .background(
                Capsule()
                    .strokeBorder(lineWidth: 2)
                    .foregroundColor(Color("button-background"))
            )
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .multilineTextAlignment(.center)
    }
}
