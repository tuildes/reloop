import Foundation
struct SpeechModel: Identifiable {
    let id: UUID = UUID()

    let character: String
    let text: String
    let special: Bool

    init(_ character: String, _ text: String, _ special: Bool = false) {
        self.character = character
        self.text = text
        self.special = special
    }
}
