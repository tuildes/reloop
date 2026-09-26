import Foundation

struct Sequence: Identifiable {
    let id: SceneID
    let era: EraID
    let modelName: String
    let speech: [Speech]
    let choose: Choose?
    let next: Destination
}
