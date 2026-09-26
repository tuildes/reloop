import Foundation

struct SingleChoose {
    let id: Int
    let title: String
    let description: String
    let icon: String
    let nextSequence: Int
    let isNextSequenceEnding: Bool

    init(
        _ id: Int,
        _ title: String,
        _ description: String,
        _ icon: String,
        _ nextSequence: Int,
        _ isNextSequenceEnding: Bool = false
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.icon = icon
        self.nextSequence = nextSequence
        self.isNextSequenceEnding = isNextSequenceEnding
    }
}

struct ChooseModel: Identifiable {
    let id: UUID = UUID()
    let chooseTitle: String
    let chooses: [SingleChoose]

    init(_ chooseTitle: String, _ chooses: [SingleChoose]) {
        self.chooseTitle = chooseTitle
        self.chooses = chooses
    }
}
