struct EndingModel {
    let id: Int

    let name: String
    let description: String
    let hint: String

    let modelName: String
    let backgroundImage: String

    init(
        id: Int,
        name: String,
        description: String,
        hint: String,
        modelName: String,
        backgroundImage: String
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.hint = hint
        self.modelName = modelName
        self.backgroundImage = backgroundImage
    }
}

extension EndingModel {
    static let all: [EndingModel] = [
        EndingModel( // Final exemplo (4)
            id: 0,
            name: "Sarau das máquinas",
            description:
                """
                Você não fez nada, as inconsistências do tempo destruíram seu mundo,
                você navega no eterno nada

                O tempo não existe mais, o eterno é o único estado possível,
                você não pode mais fazer nada, você não pode mais ser nada,
                você pode existir, contemple o eterno vazio.
                """,
            hint: "Hint 1",
            modelName: "pc_robot.usdz",
            backgroundImage: "4"
        ),
        EndingModel( // Final exemplo (4)
            id: 1,
            name: "Sem volta",
            description:
                """
                Você não fez nada, as inconsistências do tempo destruíram seu mundo,
                você navega no eterno nada

                O tempo não existe mais, o eterno é o único estado possível,
                você não pode mais fazer nada, você não pode mais ser nada,
                você pode existir, contemple o eterno vazio.
                """,
            hint: "Hint 1",
            modelName: "pc_error.usdz",
            backgroundImage: "4"
        ),
        EndingModel( // Final exemplo (4)
            id: 2,
            name: "Limbo",
            description:
                """
                Você não fez nada, as inconsistências do tempo destruíram seu mundo,
                você navega no eterno nada

                O tempo não existe mais, o eterno é o único estado possível,
                você não pode mais fazer nada, você não pode mais ser nada,
                você pode existir, contemple o eterno vazio.
                """,
            hint: "Hint 1",
            modelName: "blank.usdz",
            backgroundImage: "4"
        ),
        EndingModel( // Final exemplo (4)
            id: 3,
            name: "Ciclo eterno",
            description:
                """
                Você descobriu o porque agora
                Você está fadado a seguir este eterno ciclo
                [FINAL VERDADEIRO]
                """,
            hint: "Hint 1",
            modelName: "clock.usdz",
            backgroundImage: "4"
        ),
    ]
}
