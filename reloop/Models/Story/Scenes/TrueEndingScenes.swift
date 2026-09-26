enum TrueEndingScenes {
    static let all: [SceneDefinition] = scenes {
        scene(.home2010, era: .y2010, model: .lab, next: .scene(.fakeCredits)) {
            Warning("Voltando a 2010")
            Narrator("Ao abrir o olho, você olha em volta:\nTudo parece no lugar, seu laboratório\nSua máquina\nSua cama")
            Narrator("Finalmente você chegou em casa")
        }

        scene(.fakeCredits, era: .y2010, model: .logo, next: .scene(.inconsistencyAlert)) {
            Narrator("Parabéns por finalizar o jogo")
            Narrator("...")
            Narrator("..")
            Narrator(".")
            Narrator("Antes de terminar, existe um problema...")
        }

        choiceScene(.inconsistencyAlert, era: .y2010, model: .pcError, prompt: "Você quer desistir?") {
            Warning("~INCONSISTÊNCIAS NO TEMPO ENCONTRADAS\nALERTA PARA DESTRUIÇÃO DESTA REALIDADE~")
            You("Isso poderia estar acontecendo?\nSerá que isso é por conta do que eu mexi para voltar até 2010?")
            You("O que eu faço?\n")
            Narrator("O seu laboratório começa a ser despedaçado pela tentativa do tempo em destruir a realidade inconsistente")
        } choices: {
            Choice("Viajar no tempo", description: "Resolver o que você fez", icon: "clock.fill", to: .scene(.fixTimeline1980))
            Choice("Ficar", description: "Deixar o mundo explodir", icon: "hammer.fill", to: .ending(.limbo))
        }

        scene(.fixTimeline1980, era: .y1980, model: .journal, next: .scene(.fixTimeline2080)) {
            Narrator("Você decide viajar no tempo, agora com sua máquina original")
            Narrator("Retorna a 1980, ao se preparar para tirar a nota do cartaz e evitar problemas, você visualiza você mesmo de antes atrás de você")
            Narrator("Ao se assustar, você esquece de tirar a nota e acelera para fazer o principal:\nremover a senha colocada e refatorar a máquina, saindo daquele tempo")
        }

        scene(.fixTimeline2080, era: .y2080, model: .pcRobot, next: .scene(.realization)) {
            Narrator("Você retorna a 2080, retira a calibragem enquanto evita você mesmo do passado te ver")
        }

        scene(.realization, era: .y2010, model: .guy, next: .scene(.memoryWipe)) {
            Narrator("Retornando por fim a seu tempo original")
            Narrator("Tudo voltou a normal e o aviso de incosistências foram embora")
            Narrator("Então você se toca de um coisa...")
            You("Parece que eu era a figura que vi mais cedo...")
            You("Por isso o vTimerOS falou que estava falando comigo Novamente")
        }

        scene(.memoryWipe, era: .y2010, model: .clock, next: .ending(.eternalCycle)) {
            You("Mas como eu fui parar lá em 1980?")
            You("Talvez a solução deste problema seja eu apagar minha memória para evitar qualquer possibilidade no meu futuro voltar para lá")
            Narrator("Assim você fez")
            Narrator("Mas algo você não esperava...")
            Narrator("O seu VOLTA-TEMPO ativou sozinho após você remover suas memórias")
            Narrator("Fazendo você voltar novamente a 1980, onde tudo começou")
            Narrator("Agora, mesmo que você não se lembrasse,\nAgora você decifrou como você apareceu em 1980 sem memórias...")
        }
    }
}
