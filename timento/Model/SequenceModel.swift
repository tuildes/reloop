import Foundation
struct SequenceModel: Identifiable {
    let id: Int

    let modelName: String
    let speech: [SpeechModel]
    let choose: ChooseModel?
    let nextSequence: Int

    init(id: Int, modelName: String, speech: [SpeechModel], choose: ChooseModel? = nil, nextSequence: Int? = nil) {
        self.id = id
        self.modelName = modelName
        self.speech = speech
        self.choose = choose
        self.nextSequence = nextSequence ?? (id + 1)
    }
}
