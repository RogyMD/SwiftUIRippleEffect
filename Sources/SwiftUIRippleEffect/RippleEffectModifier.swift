import SwiftUI

@available(watchOS, unavailable)
@available(iOS 17.0, macOS 14.0, *)
struct RippleEffect<T: Equatable>: ViewModifier {
  var origin: CGPoint
  var trigger: T
  var configuration: RippleConfiguration
  
  init(at origin: CGPoint, trigger: T, configuration: RippleConfiguration) {
    self.origin = origin
    self.trigger = trigger
    self.configuration = configuration
  }
  
  func body(content: Content) -> some View {
    let origin = origin
    let duration = configuration.duration
    
    content.keyframeAnimator(
      initialValue: 0,
      trigger: trigger
    ) { view, elapsedTime in
      view.modifier(RippleModifier(
        origin: origin,
        elapsedTime: elapsedTime,
        configuration: configuration
      ))
    } keyframes: { _ in
      MoveKeyframe(0)
      LinearKeyframe(duration, duration: duration)
    }
  }
}

@available(watchOS, unavailable)
@available(iOS 17.0, macOS 14.0, *)
struct RippleModifier: ViewModifier, Sendable {
  var origin: CGPoint
  var elapsedTime: TimeInterval
  var configuration: RippleConfiguration
  
  func body(content: Content) -> some View {
    let shader = ShaderLibrary.bundle(.module).Ripple(
      .float2(origin),
      .float(elapsedTime),
      .float(configuration.amplitude),
      .float(configuration.frequency),
      .float(configuration.decay),
      .float(configuration.speed)
    )
    
    let maxSampleOffset = maxSampleOffset
    let elapsedTime = elapsedTime
    let duration = configuration.duration
    
    content.visualEffect { view, _ in
      view.layerEffect(
        shader,
        maxSampleOffset: maxSampleOffset,
        isEnabled: 0 < elapsedTime && elapsedTime < duration
      )
    }
  }
  
  var maxSampleOffset: CGSize {
    CGSize(width: configuration.amplitude, height: configuration.amplitude)
  }
}
