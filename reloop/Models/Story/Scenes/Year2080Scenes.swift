enum Year2080Scenes {
    static let all: [SceneDefinition] = scenes {
        scene(.arrive2080, era: .y2080, model: .pcRight, next: .scene(.figureReturns)) {
            Narrator("Ao colocar a sequencia ESQUERDA-DIREITA-ESQUERDA-ESQUERDA\nO VOLTA-TEMPO mostra uma mensagem de sucesso")
            Narrator("Você abre o olho, percebe que novamente você trocou de ano")
        }

        scene(.figureReturns, era: .y2080, model: .guy, next: .scene(.vTimerGreeting)) {
            Narrator("Novamente você visualiza a figura, que antes de você puder falar qualquer coisa diz")
            Line("???", "~VOCÊ NÃO SABE O QUE ESTÁ FAZENDO~", .brand)
            Narrator("Sumindo novamente ao chegar no centro da sala\nVocê se aproxima novamente do computador para tentar achar respostas e voltar a seu tempo")
            Narrator("Algo tenta falar com você e quando você olha para baixo, é o computador")
        }

        choiceScene(.vTimerGreeting, era: .y2080, model: .pcRobot, prompt: "Qual sua pergunta?") {
            Line("vTimerOS", "Olá novamente, é raro ver você!\nE vejo mais de uma vez, que incrível!")
            Line("vTimerOS", "Eu sou o vtimeOS, a versão melhorada do volta-tempo do cientista ???")
            Line("vTimerOS", "Porque está aqui de novo?")
        } choices: {
            Choice("Quem era esta pessoa que sumiu a poucos?", icon: "person.fill", to: .scene(.vTimerWhatDoYouWant))
            Choice("Estou aqui para te destruir", icon: "hammer.fill", to: .ending(.machines))
        }

        choiceScene(.vTimerWhatDoYouWant, era: .y2080, model: .pcRobot, prompt: "Qual sua pergunta?") {
            Line("vTimerOS", "Não faça uma pergunta tola desta!\nVocê mais que ninguém sabe desta respostas")
            Line("vTimerOS", "Mas me diga, o que você realmente quer?", .brand)
        } choices: {
            Choice("O que aconteceu aqui? Que anos estamos?", icon: "clock.fill", to: .scene(.vTimerHistory))
            Choice("Quero voltar", description: "Para o meu ano de origem", icon: "arrowshape.turn.up.backward.fill", to: .scene(.calibration))
        }

        choiceScene(.vTimerHistory, era: .y2080, model: .pcRobot, prompt: "Qual sua pergunta?") {
            Line("vTimerOS", "Os humanos lá por 2056 foram quase extintos, não sabemos exatamente por que")
            Line("vTimerOS", "Agora a única coisa que sobrou fomos nós, as máquinas!\nE em pleno 2080, pelo meu banco de dados, apenas existem mil humanos!")
            Line("vTimerOS", "Agora outra pergunta!\nEstou me divertindo em interagir com você novamente")
        } choices: {
            Choice("Quero voltar", description: "Para o meu ano de origem", icon: "arrowshape.turn.up.backward.fill", to: .scene(.calibration))
            Choice("Quero voltar", description: "Para o meu ano de origem", icon: "arrowshape.turn.up.backward.fill", to: .scene(.calibration))
        }

        choiceScene(.calibration, era: .y2080, model: .clock, prompt: "Calibragem: o que é?") {
            Line("vTimerOS", "Tudo bem!\nMas antes vamos calibrar minha viagem no tempo, você pode selecionar o que aparece na tela?")
            Warning("Ao errar a calibragem, o resultado da viagem do tempo se torna totalmente inesperada")
            Line("vTimerOS", "Agora outra pergunta!\nEstou me divertindo em interagir com você novamente")
        } choices: {
            Choice("Bola", icon: "cricket.ball.fill", to: .scene(.limboArrive))
            Choice("Relógio", icon: "clock.fill", to: .scene(.home2010))
        }
    }
}
