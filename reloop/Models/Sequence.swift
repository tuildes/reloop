import Foundation

struct Sequence: Identifiable {
    let id: Int
    let modelName: String
    let speech: [Speech]
    let choose: Choose?
    let nextSequence: Int
    let yearID: Int

    init(
        id: Int,
        modelName: String,
        speech: [Speech],
        choose: Choose? = nil,
        nextSequence: Int? = nil,
        yearID: Int
    ) {
        self.id = id
        self.modelName = modelName
        self.speech = speech
        self.choose = choose
        self.nextSequence = nextSequence ?? (id + 1)
        self.yearID = yearID
    }
}
