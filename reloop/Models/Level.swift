import Foundation

struct Level: Identifiable {
    let id: EraID
    let name: String
    let backgroundImage: String
}

extension Level {
    static var levels: [Level] { StoryCatalog.eras }
}
