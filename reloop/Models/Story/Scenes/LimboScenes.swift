enum LimboScenes {
    static let all: [SceneDefinition] = scenes {
        scene(.limboArrive, era: .unknown, model: .blank, next: .scene(.limboBrokenMachine)) {
            Warning("Calibragem insuficiente, impossível estimar o destino temporal")
            Narrator("Depois de errar a calibragem\nVocê foi teleportado para alguma outra era e algo parece muito errado")
        }

        scene(.limboBrokenMachine, era: .unknown, model: .pcError, next: .scene(.limboRepairChoice)) {
            Narrator("Você olha para o VOLTA-TEMPO e ele está quebrado, a falta de calibragem explodiu a máquina", .brand)
        }

        choiceScene(.limboRepairChoice, era: .unknown, model: .pcError, prompt: "Arrumar VOLTA-TEMPO?") {
            Narrator("Ao olhar ao em volta, você percebe que a sala que antes era seu laboratório, agora é um cubículo sem portas ou janelas\nComo se aquele lugar nunca tivesse sido aberto antes")
            Narrator("Antes do desespero de tomar, você pensa em algo:\nBasta arrumar a máquina")
        } choices: {
            Choice("Sim", icon: "wrench.fill", to: .scene(.limboFailedRepair))
            Choice("Não", icon: "xmark", to: .scene(.limboGiveUp))
        }

        scene(.limboFailedRepair, era: .unknown, model: .pcError, next: .scene(.limboGiveUp)) {
            Narrator("Ao tentar arrumar a máquina, você percebe que há peças faltando.")
            Narrator("Talvez a viagem no tempo perdeu a alguns pedaços da sua máquina")
            Narrator("Parece que não haverá mais escapatória para você nesta outra era")
        }

        choiceScene(.limboGiveUp, era: .unknown, model: .pcError, prompt: "Desistir") {
            Narrator("Não tem mais nada ao que ser feito")
        } choices: {
            Choice("Sim", icon: "flag.fill", to: .ending(.noReturn))
            Choice("Sim", icon: "flag.fill", to: .ending(.noReturn))
        }
    }
}
