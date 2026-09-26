import SceneKit
import SwiftUI

struct RotationItemView: UIViewRepresentable {
    typealias UIViewType = SCNView

    var rotationAngle: Float
    let modelName: String
    let animationDuration: TimeInterval = 0.75

    final class Coordinator {
        var currentModelName: String?
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        sceneView.autoenablesDefaultLighting = true
        sceneView.backgroundColor = UIColor.clear
        updateScene(for: sceneView, context: context, animated: false)
        return sceneView
    }

    func updateUIView(_ uiView: SCNView, context: Context) {
        uiView.scene?.rootNode.eulerAngles.z = rotationAngle

        if modelName != context.coordinator.currentModelName {
            performFadeTransition(on: uiView, context: context)
        }
    }

    private func updateScene(for view: SCNView, context: Context, animated: Bool) {
        guard let scene = SCNScene(named: modelName) else {
            print("Failed to load model: \(modelName)")
            return
        }

        scene.rootNode.eulerAngles.z = rotationAngle

        if animated {
            scene.rootNode.opacity = 0.0
        }

        view.scene = scene

        if animated {
            let fadeInAction = SCNAction.fadeIn(duration: animationDuration)
            scene.rootNode.runAction(fadeInAction)
        }

        context.coordinator.currentModelName = modelName
        view.pointOfView?.camera?.fieldOfView = 70
    }

    private func performFadeTransition(on view: SCNView, context: Context) {
        let fadeOutAction = SCNAction.fadeOut(duration: animationDuration)
        view.scene?.rootNode.runAction(fadeOutAction) {
            DispatchQueue.main.async {
                self.updateScene(for: view, context: context, animated: true)
            }
        }
    }
}
