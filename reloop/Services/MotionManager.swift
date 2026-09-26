import CoreMotion
import SwiftUI

func vibrate(style: UIImpactFeedbackGenerator.FeedbackStyle) {
    let generator = UIImpactFeedbackGenerator(style: style)
    generator.impactOccurred()
}

@Observable
final class MotionManager {
    private let motionManager = CMMotionManager()
    private var previousYaw: Double = 0.0
    private var maxAngle: Double = 45.0

    var motionEnabled: Bool = true
    var actualAngle: Double = 0.0

    init() {
        motionManager.deviceMotionUpdateInterval = 0.1 / 60.0
        startUpdates()
    }

    private func startUpdates() {
        guard motionManager.isDeviceMotionAvailable else {
            motionEnabled = false
            return
        }

        previousYaw = 0.0
        actualAngle = 0.0

        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] motionData, error in
            guard let self, let motionData else { return }

            if let error {
                print("Motion error: \(error.localizedDescription)")
                return
            }

            let currentYaw = motionData.attitude.yaw * 180 / .pi
            var deltaYaw = currentYaw - self.previousYaw

            if self.previousYaw == 0.0 {
                self.previousYaw = currentYaw
                deltaYaw = 0.0
            }

            self.previousYaw = currentYaw

            if self.maxAngle != 0.0 && abs(self.actualAngle + deltaYaw) < self.maxAngle {
                withAnimation {
                    self.actualAngle += deltaYaw
                }

                if trunc(fabs(self.actualAngle)) == 15 && fabs(deltaYaw) > 0.1 {
                    vibrate(style: .medium)
                }
            }
        }
    }

    func resetAngle(_ maxAngle: Double = 45.0) {
        previousYaw = 0.0
        actualAngle = 0.0
        self.maxAngle = maxAngle
    }

    func nudge(by amount: Double) {
        withAnimation {
            let next = actualAngle + amount
            if abs(next) < maxAngle {
                actualAngle = next
            }
        }
    }

    func getAngle() -> Float {
        Float(-actualAngle * .pi / 180)
    }

    deinit {
        motionManager.stopDeviceMotionUpdates()
    }
}
