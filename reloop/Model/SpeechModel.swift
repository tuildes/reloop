import Foundation
import SwiftUI
struct SpeechModel: Identifiable {
    let id: UUID = UUID()

    let character: String
    let text: String
    let color: Color

    init(_ character: String, _ text: String, _ color: Color = .appSecondary) {
        self.character = character
        self.text = text
        self.color = color
    }
}
