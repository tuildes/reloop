import Foundation

struct ChoiceOption: Identifiable {
    let id: UUID = UUID()
    let title: String
    let description: String
    let icon: String
    let destination: Destination
}

struct Choose: Identifiable {
    let id: UUID = UUID()
    let chooseTitle: String
    let chooses: [ChoiceOption]

    init(_ chooseTitle: String, _ chooses: [ChoiceOption]) {
        self.chooseTitle = chooseTitle
        self.chooses = chooses
    }
}
