import SceneKit
import SwiftUI

struct RotationItemView: UIViewRepresentable {
    typealias UIViewType = SCNView
    typealias Context = UIViewRepresentableContext<RotationItemView>

    var rotationAngle: Float
    let modelName: String

    func updateUIView(_ uiView: SCNView, context: Context) {
        uiView.scene?.rootNode.eulerAngles.y = rotationAngle
    }

    func makeUIView(context: Context) -> UIViewType {
        guard let scene: SCNScene = SCNScene(named: modelName) else {
            fatalError("Failed to load scene")
        }

        let sceneView: SCNView = SCNView()

        sceneView.autoenablesDefaultLighting = true
        sceneView.backgroundColor = UIColor.clear
        sceneView.scene = scene

        scene.rootNode.eulerAngles.y = rotationAngle

        return sceneView
    }
}
