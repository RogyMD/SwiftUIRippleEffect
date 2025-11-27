import SwiftUI

extension View {
  /// Adds a ripple animation that plays whenever the given trigger value changes.
  ///
  /// The modifier creates a circular ripple expanding from the provided origin point.
  /// When the `trigger` value updates (based on `Equatable` comparison), the ripple
  /// animation runs automatically. This is useful for animating taps, state changes,
  /// or other discrete events without needing to manually control animations.
  ///
  /// - Parameters:
  ///   - origin: The point inside the view where the ripple should originate.
  ///   - trigger: A value whose change causes the ripple to play. When this value
  ///              differs from its previous value, a new ripple animation is triggered.
  ///   - configuration: Optional configuration of the ripple. See ``RippleConfiguration``
  ///
  /// - Returns: A view with ripple animation behavior applied.
  @available(watchOS, unavailable)
  @available(iOS 17.0, macOS 14.0, *)
  public func rippleEffect<T: Equatable>(
    at origin: CGPoint,
    trigger: T,
    configuration: RippleConfiguration = .defaultConfiguration
  ) -> some View {
    modifier(RippleEffect(at: origin, trigger: trigger, configuration: configuration))
  }
}
