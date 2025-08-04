import SceneKit
import SwiftUI

struct RotationItemView: UIViewRepresentable {
    typealias UIViewType = SCNView
    typealias Context = UIViewRepresentableContext<RotationItemView>

    var rotationAngle: Float
    let modelName: String
    let animationDuration: TimeInterval = 0.75

    class Coordinator {
        var currentModelName: String?
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    func makeUIView(context: Context) -> UIViewType {
        let sceneView = SCNView()
        sceneView.autoenablesDefaultLighting = true
        sceneView.backgroundColor = UIColor.clear

        // Carrega a cena inicial sem animação
        updateScene(for: sceneView, context: context, animated: false)

        return sceneView
    }

    func updateUIView(_ uiView: SCNView, context: Context) {
        // A rotação pode ser atualizada a qualquer momento
        uiView.scene?.rootNode.eulerAngles.z = rotationAngle

        // Verifica se o nome do modelo mudou para iniciar a transição
        if modelName != context.coordinator.currentModelName {
            performFadeTransition(on: uiView, context: context)
        }
    }

    // Função auxiliar foi atualizada para aceitar um parâmetro 'animated'
    private func updateScene(for view: SCNView, context: Context, animated: Bool) {
        guard let scene = SCNScene(named: modelName) else {
            print("Falha ao carregar o modelo: \(modelName)")
            return
        }

        scene.rootNode.eulerAngles.z = rotationAngle

        // Se for animado, começa transparente para o fade in
        if animated {
            scene.rootNode.opacity = 0.0
        }

        view.scene = scene

        // Se for animado, executa a ação de fade in
        if animated {
            let fadeInAction = SCNAction.fadeIn(duration: animationDuration)
            scene.rootNode.runAction(fadeInAction)
        }

        context.coordinator.currentModelName = modelName
        print("Modelo trocado para: \(modelName)")
    }

    // Nova função para gerenciar a transição com fade out e fade in
    private func performFadeTransition(on view: SCNView, context: Context) {
        // 1. Prepara a ação de Fade Out
        let fadeOutAction = SCNAction.fadeOut(duration: animationDuration)

        // 2. Executa o Fade Out no modelo atual
        // Usamos um completion handler que será executado ao final da animação
        view.scene?.rootNode.runAction(fadeOutAction) {
            // 3. Quando o fade out termina, troca a cena e faz o fade in
            // O 'updateScene' agora é chamado com animated = true
            // Isso fará com que o novo modelo comece com opacidade 0 e execute um fadeIn
            DispatchQueue.main.async { // Garante que a atualização da UI ocorra na thread principal
                 self.updateScene(for: view, context: context, animated: true)
            }
        }
    }
}
