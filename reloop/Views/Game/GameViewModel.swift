import SwiftUI

@Observable
final class GameViewModel {
    let motionManager = MotionManager()

    var currentScene: Sequence = StoryCatalog.startSequence()
    var actualSpeech: Int = 0

    private let router: AppRouter

    init(router: AppRouter) {
        self.router = router
    }

    var currentLevel: Level {
        StoryCatalog.level(for: currentScene.era)
    }

    var isShowingChoices: Bool {
        actualSpeech == currentScene.speech.count && currentScene.choose != nil
    }

    var currentChoose: Choose? {
        guard isShowingChoices else { return nil }
        return currentScene.choose
    }

    var canConfirmChoice: Bool {
        trunc(fabs(motionManager.actualAngle)) >= 15
    }

    var choiceLabel: String {
        trunc(motionManager.actualAngle) >= 15 ? "esquerda" : "Direita"
    }

    func advanceSpeech() {
        guard actualSpeech < currentScene.speech.count else { return }

        if actualSpeech == currentScene.speech.count - 1 {
            if currentScene.choose != nil {
                withAnimation {
                    actualSpeech += 1
                }
            } else {
                follow(currentScene.next)
            }
        } else {
            withAnimation {
                actualSpeech += 1
            }
        }
    }

    func confirmChoice() {
        guard let choose = currentScene.choose else { return }
        let chooseIndex = trunc(motionManager.actualAngle) > 15 ? 0 : 1
        guard chooseIndex < choose.chooses.count else { return }
        follow(choose.chooses[chooseIndex].destination)
    }

    private func follow(_ destination: Destination) {
        switch destination {
        case .scene(let id):
            currentScene = StoryCatalog.sequence(id)
            actualSpeech = 0
        case .ending(let id):
            router.push(.ending(id))
        }
    }
}