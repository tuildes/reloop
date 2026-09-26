struct Ending: Identifiable {
    let id: EndingID
    let name: String
    let description: String
    let hint: String
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
            hint: "Hint 1",
            modelName: ModelAsset.pcRobot.rawValue,
            backgroundImage: "bg4"
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
            hint: "Hint 1",
            modelName: ModelAsset.pcError.rawValue,
            backgroundImage: "bg4"
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
            hint: "Hint 1",
            modelName: ModelAsset.blank.rawValue,
            backgroundImage: "bg4"
        ),
        Ending(
            id: .eternalCycle,
            name: "Ciclo eterno",
            description: """
                Você descobriu o porque agora
                Você está fadado a seguir este eterno ciclo
                [FINAL VERDADEIRO]
                """,
            hint: "Hint 1",
            modelName: ModelAsset.clock.rawValue,
            backgroundImage: "bg4"
        ),
    ]

    static func ending(id: EndingID) -> Ending {
        all.first { $0.id == id } ?? all[0]
    }
}
