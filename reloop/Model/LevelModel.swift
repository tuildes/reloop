import Foundation
struct LevelModel: Identifiable {
    let id: UUID = UUID()

    let name: String
    let backgroundImage: String

    init(_ name: String, _ backgroundImage: String) {
        self.name = name
        self.backgroundImage = backgroundImage
    }
}

extension LevelModel {
    static let levels: [LevelModel] = [
        LevelModel("2025", "placeholder")
    ]

    private static let sequences: [SequenceModel] = [
        // Ano 2025
        SequenceModel(
            id: 0,
            modelName: "toy_biplane_realistic.usdz",
            speech: [
                SpeechModel("Character 1", "Welcome to the game!"),
                SpeechModel("Character 2", "Let's start our adventure!")
            ],
            yearID: 0
        ),
        SequenceModel(
            id: 1,
            modelName: "toy_biplane_realistic.usdz",
            speech: [
                SpeechModel("Character 1", "What do you want to do next?"),
                SpeechModel("Character 2", "Choose wisely!")
            ],
            choose: ChooseModel("Choose an action", [
                SingleChoose(0, "Action 1", "Do something exciting!", "cat.fill", 2),
                SingleChoose(1, "Action 2", "Take a different path.", "cat.fill", 3)
            ]),
            yearID: 0
        ),
        SequenceModel(
            id: 2,
            modelName: "toy_biplane_realistic.usdz",
            speech: [
                SpeechModel("Character 1", "What do you want to do next?"),
                SpeechModel("Character 2", "Choose wisely!")
            ],
            nextSequence: 4,
            yearID: 0
        ),

        // Level 2010
        SequenceModel(
            id: 3,
            modelName: "toy_biplane_realistic.usdz",
            speech: [
                SpeechModel("Character 1", "Welcome to the game!"),
                SpeechModel("Character 2", "Let's start our adventure!")
            ],
            yearID: 0
        ),
        SequenceModel(
            id: 4,
            modelName: "toy_biplane_realistic.usdz",
            speech: [
                SpeechModel("Character 1", "What do you want to do next?"),
                SpeechModel("Character 2", "Choose wisely!")
            ],
            choose: ChooseModel("Choose an action", [
                SingleChoose(0, "Action 1", "Do something exciting!", "cat.fill", 5),
                SingleChoose(1, "Action 2", "Acabar", "cat.fill", 0, true)
            ]),
            yearID: 0
        ),
        SequenceModel(
            id: 5,
            modelName: "toy_biplane_realistic.usdz",
            speech: [
                SpeechModel("Character 1", "What do you want to do next?"),
                SpeechModel("Character 2", "Choose wisely!")
            ],
            choose: ChooseModel("Choose an action", [
                SingleChoose(0, "Action 1", "Acabar", "cat.fill", 1, true),
                SingleChoose(1, "Action 2", "Acabar.", "cat.fill", 1, true)
            ]),
            yearID: 0
        )
    ]

    static func startSequence() -> SequenceModel {
        return LevelModel.sequences[0]
    }

    static func nextSequence (_ currentSequence: Int) -> SequenceModel {
        guard LevelModel.sequences[currentSequence].nextSequence < LevelModel.sequences.count else {
            print("Tentando acessar sequencia inexistente")
            return LevelModel.sequences[0]
        }

        return LevelModel.sequences[LevelModel.sequences[currentSequence].nextSequence]
    }

    // Apenas retorna a proxima sequencia dentro do mesmo level
    static func chooseSequence (_ currentSequence: SequenceModel, _ choose: Int = 0) -> SequenceModel {
        // Verifica se nao esta em estado de erro
        guard let chooseModel: ChooseModel = currentSequence.choose, !chooseModel.chooses[choose].isNextSequenceEnding else {
            fatalError("Sequencia impossivel de escolha")
        }

        return LevelModel.sequences[chooseModel.chooses[choose].nextSequence]
    }
}
