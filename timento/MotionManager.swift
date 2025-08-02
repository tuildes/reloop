import CoreMotion

class MotionManager: ObservableObject {
    private let motionManager: CMMotionManager = CMMotionManager()

    private var previousYaw: Double = 0.0
    private var maxAngle: Double = 45.0
    @Published var motionEnabled: Bool = true
    @Published var actualAngle: Double = 0.0

    init() {
        motionManager.deviceMotionUpdateInterval = 0.1 / 60.0 // 60 FPS
        startUpdates()
    }

    private func startUpdates() {
        guard motionManager.isDeviceMotionAvailable else {
            print("Erro: Motion Device não disponível")
            self.motionEnabled = false
            return
        }

        self.previousYaw = 0.0
        self.actualAngle = 0.0

        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] motionData, error in
            guard let self: MotionManager = self, let motionData: CMDeviceMotion = motionData else { return }

            // Verificar erros de motion
            if let error: any Error = error {
                print("Erro: \(error.localizedDescription)")
                return
            }

            // Atualizar a rotação com base nos dados do giroscópio
            let currentYaw: Double = motionData.attitude.yaw * 180 / .pi
            var deltaYaw: Double = currentYaw - self.previousYaw

            // Valor de reset
            if self.previousYaw == 0.0 {
                self.previousYaw = currentYaw
                deltaYaw = 0.0
            }

            // Arruma o angulo para ficar entre -180 e 180 graus
            if (deltaYaw > 180) {
                deltaYaw -= 360
            } else if (deltaYaw < -180) {
                deltaYaw += 360
            }

            // Atualizacao de estados
            self.previousYaw = currentYaw

            // Limitar o angulo atual ao maximo permitido
            if (self.maxAngle != 0.0 && abs(self.actualAngle + deltaYaw) < self.maxAngle) {
                self.actualAngle += deltaYaw
            }
        }
    }

    func resetAngle(_ maxAngle: Double = 45.0) {
        self.previousYaw = 0.0
        self.actualAngle = 0.0
        self.maxAngle = maxAngle
    }

    func getYAngle() -> Float {
        return Float(actualAngle * .pi / 180)
    }

    deinit {
        motionManager.stopDeviceMotionUpdates()
    }
}
