import Foundation

/// Configuration values that define the motion and appearance of a ripple animation.
public struct RippleConfiguration: Sendable {
  var duration: TimeInterval = 3
  var amplitude: Double = 12
  var frequency: Double = 15
  var decay: Double = 8
  var speed: Double = 1200
  /// Creates a new ripple configuration with optional custom parameters.
  ///
  /// - Parameters:
  ///   - duration: The total duration of the ripple animation, in seconds.
  ///              Higher values make the ripple linger and evolve more slowly.
  ///   - amplitude: The maximum vertical displacement of the wave.
  ///                Larger amplitudes produce stronger, more pronounced ripples.
  ///   - frequency: The number of oscillations contained within the ripple.
  ///                Higher frequencies create tighter, more rapid wave patterns.
  ///   - decay: How quickly the ripple’s motion diminishes as it expands.
  ///            Higher values cause the wave to soften and fade sooner.
  ///   - speed: The outward propagation speed of the ripple, in points per second.
  ///            Larger values cause faster expansion from the origin.
  public init(
    duration: TimeInterval = 3,
    amplitude: Double = 12,
    frequency: Double = 15,
    decay: Double = 8,
    speed: Double = 1200
  ) {
    self.duration = duration
    self.amplitude = amplitude
    self.frequency = frequency
    self.decay = decay
    self.speed = speed
  }
  public static let defaultConfiguration = RippleConfiguration()
}
