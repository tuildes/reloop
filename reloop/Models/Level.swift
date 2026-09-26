import Foundation

struct Level: Identifiable {
    let id: UUID = UUID()
    let name: String
    let backgroundImage: String

    init(_ name: String, _ backgroundImage: String) {
        self.name = name
        self.backgroundImage = backgroundImage
    }
}

extension Level {
    static let levels: [Level] = [
        Level("2010", "bg1"),
        Level("1980", "bg2"),
        Level("2080", "bg2"),
        Level("???", "bg2"),
    ]

    private static let sequences: [Sequence] = []

    static func sequenceLastIndex() -> Int {
        max(sequences.count - 1, 0)
    }

    static func startSequence() -> Sequence {
        sequences.first ?? Sequence(
            id: 0,
            modelName: "blank.usdz",
            speech: [],
            yearID: 0
        )
    }

    static func nextSequence(_ currentSequence: Int) -> Sequence {
        guard currentSequence >= 0, currentSequence < sequences.count else {
            return startSequence()
        }

        let nextIndex = sequences[currentSequence].nextSequence
        guard nextIndex >= 0, nextIndex < sequences.count else {
            return startSequence()
        }

        return sequences[nextIndex]
    }

    static func chooseSequence(_ currentSequence: Sequence, _ choose: Int = 0) -> Sequence {
        guard
            let chooseModel = currentSequence.choose,
            choose >= 0,
            choose < chooseModel.chooses.count,
            !chooseModel.chooses[choose].isNextSequenceEnding
        else {
            return currentSequence
        }

        let nextIndex = chooseModel.chooses[choose].nextSequence
        guard nextIndex >= 0, nextIndex < sequences.count else {
            return currentSequence
        }

        return sequences[nextIndex]
    }

    static func sequence(at id: Int) -> Sequence? {
        sequences.first { $0.id == id }
    }
}
