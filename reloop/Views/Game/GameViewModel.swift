import SwiftUI

@Observable
final class GameViewModel {
    let levels: [Level] = Level.levels
    let motionManager = MotionManager()

    var actualSequence: Int = 0
    var actualSequenceModel: Sequence = Level.startSequence()
    var actualSpeech: Int = 0
    var actualLevel: Int = 0

    private let router: AppRouter

    init(router: AppRouter) {
        self.router = router
    }

    var currentLevel: Level {
        guard actualLevel >= 0, actualLevel < levels.count else {
            return levels[0]
        }
        return levels[actualLevel]
    }

    var isShowingChoices: Bool {
        actualSpeech == actualSequenceModel.speech.count
            && actualSequenceModel.choose != nil
    }

    var currentChoose: Choose? {
        guard isShowingChoices else { return nil }
        return actualSequenceModel.choose
    }

    var canConfirmChoice: Bool {
        trunc(fabs(motionManager.actualAngle)) >= 15
    }

    var choiceLabel: String {
        trunc(motionManager.actualAngle) >= 15 ? "esquerda" : "Direita"
    }

    func advanceSpeech() {
        guard actualSpeech < actualSequenceModel.speech.count else { return }

        if actualSpeech == actualSequenceModel.speech.count - 1 {
            if actualSequence == Level.sequenceLastIndex() {
                router.push(.ending(3))
                return
            }

            if actualSequenceModel.choose != nil {
                withAnimation {
                    actualSpeech += 1
                }
            } else {
                withAnimation {
                    actualSequenceModel = Level.nextSequence(actualSequence)
                    actualLevel = actualSequenceModel.yearID
                    actualSequence = actualSequenceModel.id
                    actualSpeech = 0
                }
            }
        } else {
            withAnimation {
                actualSpeech += 1
            }
        }
    }

    func confirmChoice() {
        guard let choose = actualSequenceModel.choose else { return }
        let chooseIndex = trunc(motionManager.actualAngle) > 15 ? 0 : 1
        guard chooseIndex < choose.chooses.count else { return }

        let selected = choose.chooses[chooseIndex]

        if selected.isNextSequenceEnding {
            router.push(.ending(selected.nextSequence))
        } else {
            withAnimation {
                actualSequenceModel = Level.chooseSequence(actualSequenceModel, selected.id)
                actualSequence = actualSequenceModel.id
                actualLevel = actualSequenceModel.yearID
                actualSpeech = 0
            }
        }
    }
}
