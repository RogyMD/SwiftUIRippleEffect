import SwiftUI
import SwiftUIRippleEffect

struct ContentView: View {
  @State var rippleOrigin: CGPoint = .zero
  @State var trigger: Bool = false
  
  var body: some View {
    Image(systemName: "sun.max.circle.fill")
      .resizable()
      .aspectRatio(contentMode: .fit)
      .foregroundStyle(.tint)
      .rippleEffect(at: rippleOrigin, trigger: trigger)
      .contentShape(Rectangle())
      .onTapGesture { origin in
        rippleOrigin = origin
        trigger.toggle()
      }
  }
}

#Preview {
  ContentView()
}

