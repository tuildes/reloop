import Foundation

struct StoryCatalog {
    static let startID: SceneID = .intro

    static let eras: [Level] = [
        Level(id: .y2010, name: "2010", backgroundImage: "bg1"),
        Level(id: .y1980, name: "1980", backgroundImage: "bg2"),
        Level(id: .y2080, name: "2080", backgroundImage: "bg3"),
        Level(id: .unknown, name: "???", backgroundImage: "bg4"),
    ]

    private static let allDefinitions: [SceneDefinition] =
        IntroScenes.all
        + Year1980Scenes.all
        + Year2080Scenes.all
        + LimboScenes.all
        + TrueEndingScenes.all

    private static let sequenceByID: [SceneID: Sequence] = {
        Dictionary(uniqueKeysWithValues: allDefinitions.map { ($0.id, $0.makeSequence()) })
    }()

    static func startSequence() -> Sequence {
        sequence(startID)
    }

    static func sequence(_ id: SceneID) -> Sequence {
        guard let sequence = sequenceByID[id] else {
            assertionFailure("Missing scene: \(id)")
            return sequenceByID[startID]!
        }
        return sequence
    }

    static func level(for era: EraID) -> Level {
        eras.first { $0.id == era } ?? eras[0]
    }

    static func resolve(_ destination: Destination) -> Sequence? {
        switch destination {
        case .scene(let id):
            return sequence(id)
        case .ending:
            return nil
        }
    }
}
