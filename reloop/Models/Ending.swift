struct Ending: Identifiable {
    let id: EndingID
    let name: String
    let description: String
    let modelName: String
    let backgroundImage: String
}

extension Ending {
    static let all: [Ending] = [
        Ending(
            id: .machines,
            name: "Sarau das máquinas",
            description: """
                Você não fez nada, as inconsistências do tempo destruíram seu mundo,
                você navega no eterno nada

                O tempo não existe mais, o eterno é o único estado possível,
                você não pode mais fazer nada, você não pode mais ser nada,
                você pode existir, contemple o eterno vazio.
                """,
            modelName: ModelAsset.pcRobot.rawValue,
            backgroundImage: "bg_ending"
        ),
        Ending(
            id: .noReturn,
            name: "Sem volta",
            description: """
                Você não fez nada, as inconsistências do tempo destruíram seu mundo,
                você navega no eterno nada

                O tempo não existe mais, o eterno é o único estado possível,
                você não pode mais fazer nada, você não pode mais ser nada,
                você pode existir, contemple o eterno vazio.
                """,
            modelName: ModelAsset.pcError.rawValue,
            backgroundImage: "bg_ending"
        ),
        Ending(
            id: .limbo,
            name: "Limbo",
            description: """
                Você não fez nada, as inconsistências do tempo destruíram seu mundo,
                você navega no eterno nada

                O tempo não existe mais, o eterno é o único estado possível,
                você não pode mais fazer nada, você não pode mais ser nada,
                você pode existir, contemple o eterno vazio.
                """,
            modelName: ModelAsset.blank.rawValue,
            backgroundImage: "bg_ending"
        ),
        Ending(
            id: .eternalCycle,
            name: "Ciclo eterno",
            description: """
                Você descobriu o porque agora
                Você está fadado a seguir este eterno ciclo
                [FINAL VERDADEIRO]
                """,
            modelName: ModelAsset.clock.rawValue,
            backgroundImage: "bg_ending"
        ),
    ]

    static func ending(id: EndingID) -> Ending {
        all.first { $0.id == id } ?? all[0]
    }
}
