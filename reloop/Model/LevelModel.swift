import Foundation
struct LevelModel: Identifiable {
    let id: UUID = UUID()

    let name: String
    let backgroundImage: String

    init(_ name: String, _ backgroundImage: String) {
        self.name = name
        self.backgroundImage = backgroundImage
    }
}

extension LevelModel {
    static let levels: [LevelModel] = [
        LevelModel("2010", "1"),
        LevelModel("1980", "2"),
        LevelModel("2080", "3"),
        LevelModel("???", "4")
    ]

    private static let sequences: [SequenceModel] = [
        // Introducao
        SequenceModel(
            id: 0,
            modelName: "clock.usdz",
            speech: [
                SpeechModel("Narrador", "Um cientista se tranca por meses em seu laboratório em busca dos segredos da viagem do tempo\nTodos duvidavam de sua área de pesquisa", true),
                SpeechModel("Narrador", "Mas o que ninguém sabia, que ele (você), a poucos minutos tinha finalizado a sua nova invenção:\nUm pequeno computador que permitia a volta no tempo, chamado Volta Tempo", true),
                SpeechModel("Narrador", "Mas existia um pequeno problema...\nVocê não sabe por que, mas existe um buraco na memória, do momento da criação do Volta-Tempo\nE o agora...")
            ],
            yearID: 0
        ),

        // Anos 1980
        SequenceModel(
            id: 1,
            modelName: "clock.usdz",
            speech: [
                SpeechModel("Você", "Não lembro o que exatamente aconteceu\nMas pelo visto, o Volta Tempo me trocou de era"),
                SpeechModel("Você", "Esta sala é familiar, está parecendo que é a minha, mas em outro período?")
            ],
            yearID: 1
        ),
        SequenceModel(
            id: 2,
            modelName: "guy.usdz",
            speech: [
                SpeechModel("Narrador", "Ao olhar para frente, você visualiza uma pessoa no centro da sala"),
                SpeechModel("Narrador", "Ela vira e vê você, se assustando. Ao se virar novamente diz: NÃO DIGITE O QUE ESTÁ NO CARTAZ"),
                SpeechModel("Narrador", "A figura então mexe com algo no centro da sala\nAntes que você percebe ela já desapareceu"),
                SpeechModel("Narrador", "Apesar de toda estranheza, você precisa achar alguma forma de voltar a seu tempo, e talvez esta figura tenha a solução"),
            ],
            yearID: 1
        ),
        SequenceModel(
            id: 3,
            modelName: "journal.usdz",
            speech: [
                SpeechModel("Você", "Parece que tem um cartaz que a figura tera mencionado"),
            ],
            choose: ChooseModel("Olhar o cartaz?", [
                SingleChoose(0, "Não", "", "checkmark", 5),
                SingleChoose(1, "Sim", "", "x.circle.fill", 4)
            ]),
            yearID: 1
        ),
        SequenceModel(
            id: 4,
            modelName: "journal.usdz",
            speech: [
                SpeechModel("Narrador", "Ao chegar mais perto do cartaz\nVocê visualiza: 1984"),
                SpeechModel("Narrador", "Ao olhar mais abaixo existe uma nota\nESQUERDA DIREITA ESQUERDA ESQUERDA"),
                SpeechModel("Narrador", "Você não entende o que exatamente significa,\nMas para não perder tempo, você para de olhar o cartaz e prossegue sua jornada"),
            ],
            yearID: 1
        ),
        SequenceModel(
            id: 5,
            modelName: "pc_right.usdz",
            speech: [
                SpeechModel("Narrador", "Ao olhar ao centro da sala, parece que o VOLTA-TEMPO viajou junto com você"),
                SpeechModel("Narrador", "Você se aproxima e visualiza que ele pelo jeito está funcionando como deveria\nMas por algum motivo pede uma série de entradas\nde setas ESQUERDA DIREITA"),
                SpeechModel("Narrador", "Parece que há uma nota no VOLTA-TEMPO\nVeja o cartaz para... [O restante parece rasgado]"),
            ],
            yearID: 1
        ),
        SequenceModel(
            id: 6,
            modelName: "pc_right.usdz",
            speech: [],
            choose: ChooseModel("Você quer tentar uma senha?", [
                SingleChoose(0, "Não", "Olhar o cartaz", "newspaper.fill", 4),
                SingleChoose(1, "Sim", "Digitar a senha", "lock.fill", 7)
            ]),
            yearID: 1
        ),
        SequenceModel(
            id: 7,
            modelName: "pc_right.usdz",
            speech: [],
            choose: ChooseModel("Senha: ----", [
                SingleChoose(0, "Esquerda", "", "arrowshape.left", 8),
                SingleChoose(1, "Direita", "", "arrowshape.right", 11)
            ]),
            yearID: 1
        ),
        SequenceModel(
            id: 8,
            modelName: "pc_right.usdz",
            speech: [],
            choose: ChooseModel("Senha: <---", [
                SingleChoose(0, "Esquerda", "", "arrowshape.left", 11),
                SingleChoose(1, "Direita", "", "arrowshape.right", 9)
            ]),
            yearID: 1
        ),
        SequenceModel(
            id: 9,
            modelName: "pc_right.usdz",
            speech: [],
            choose: ChooseModel("Senha: <>--", [
                SingleChoose(0, "Esquerda", "", "arrowshape.left", 10),
                SingleChoose(1, "Direita", "", "arrowshape.right", 11)
            ]),
            yearID: 1
        ),
        SequenceModel(
            id: 10,
            modelName: "pc_right.usdz",
            speech: [],
            choose: ChooseModel("Senha: <><-", [
                SingleChoose(0, "Esquerda", "", "arrowshape.left", 12),
                SingleChoose(1, "Direita", "", "arrowshape.right", 11)
            ]),
            yearID: 1
        ),
        SequenceModel(
            id: 11,
            modelName: "pc_right.usdz",
            speech: [
                SpeechModel("Aviso", "Senha incorreta\nAbortando viagem no tempo"),
            ],
            nextSequence: 6,
            yearID: 1
        ),

        // Anos 2080
        SequenceModel(
            id: 12,
            modelName: "pc_right.usdz",
            speech: [
                SpeechModel("Narrador", "Ao colocar a sequencia ESQUERDA-DIREITA-ESQUERDA-ESQUERDA\nO VOLTA-TEMPO mostra uma mensagem de sucesso"),
                SpeechModel("Narrador", "Você abre o olho, percebe que novamente você trocou de ano"),
            ],
            yearID: 2
        ),
        SequenceModel(
            id: 13,
            modelName: "guy.usdz",
            speech: [
                SpeechModel("Narrador", "Novamente você visualiza a figura, que antes de você puder falar qualquer coisa diz"),
                SpeechModel("???", "VOCÊ NÃO SABE O QUE ESTÁ FAZENDO", true),
                SpeechModel("Narrador", "Sumindo novamente ao chegar no centro da sala\nVocê se aproxima novamente do computador para tentar achar respostas e voltar a seu tempo"),
                SpeechModel("Narrador", "Algo tenta falar com você e quando você olha para baixo, é o computador"),
            ],
            yearID: 2
        ),
        SequenceModel(
            id: 14,
            modelName: "pc_robot.usdz",
            speech: [
                SpeechModel("vTimerOS", "Olá novamente, é raro ver você!\nE vejo mais de uma vez, que incrível!"),
                SpeechModel("vTimerOS", "Eu sou o vtimeOS, a versão melhorada do volta-tempo do cientista ???"),
                SpeechModel("vTimerOS", "Porque está aqui de novo?"),
            ],
            choose: ChooseModel("Qual sua pergunta?", [
                SingleChoose(0, "Quem era esta pessoa que sumiu a poucos?", "", "person.fill", 15),
                SingleChoose(1, "Estou aqui para te destruir", "", "hammer.fill", 0, true)
            ]),
            yearID: 2
        ),
        SequenceModel(
            id: 15,
            modelName: "pc_robot.usdz",
            speech: [
                SpeechModel("vTimerOS", "Não faça uma pergunta tola desta!\nVocê mais que ninguém sabe desta respostas"),
                SpeechModel("vTimerOS", "Mas me diga, o que você realmente quer?", true),
            ],
            choose: ChooseModel("Qual sua pergunta?", [
                SingleChoose(0, "O que aconteceu aqui? Que anos estamos?", "", "clock.fill", 16),
                SingleChoose(1, "Quero voltar", "Para o meu ano de origem", "arrowshape.turn.up.backward.fill", 17)
            ]),
            yearID: 2
        ),
        SequenceModel(
            id: 16,
            modelName: "pc_robot.usdz",
            speech: [
                SpeechModel("vTimerOS", "Os humanos lá por 2056 foram quase extintos, não sabemos exatamente por que"),
                SpeechModel("vTimerOS", "Agora a única coisa que sobrou fomos nós, as máquinas!\nE em pleno 2080, pelo meu banco de dados, apenas existem mil humanos!"),
                SpeechModel("vTimerOS", "Agora outra pergunta!\nEstou me divertindo em interagir com você novamente"),
            ],
            choose: ChooseModel("Qual sua pergunta?", [
                SingleChoose(0, "Quero voltar", "Para o meu ano de origem", "arrowshape.turn.up.backward.fill", 17),
                SingleChoose(1, "Quero voltar", "Para o meu ano de origem", "arrowshape.turn.up.backward.fill", 17)
            ]),
            yearID: 2
        ),
        SequenceModel(
            id: 17,
            modelName: "clock.usdz",
            speech: [
                SpeechModel("vTimerOS", "Tudo bem!\nMas antes vamos calibrar minha viagem no tempo, você pode selecionar o que aparece na tela?"),
                SpeechModel("Aviso", "Ao errar a calibragem, o resultado da viagem do tempo se torna totalmente inesperada"),
                SpeechModel("vTimerOS", "Agora outra pergunta!\nEstou me divertindo em interagir com você novamente"),
            ],
            choose: ChooseModel("Calibragem: o que é?", [
                SingleChoose(0, "Bola", "", "cricket.ball.fill", 18),
                SingleChoose(1, "Relógio", "", "clock.fill", 23)
            ]),
            yearID: 2
        ),

        // Final ruim (ano ????)
        SequenceModel(
            id: 18,
            modelName: "blank.usdz",
            speech: [
                SpeechModel("Aviso", "Calibragem insuficiente, impossível estimar o destino temporal"),
                SpeechModel("Narrador", "Depois de errar a calibragem\nVocê foi teleportado para alguma outra era e algo parece muito errado"),
            ],
            yearID: 3
        ),
        SequenceModel(
            id: 19,
            modelName: "pc_error.usdz",
            speech: [
                SpeechModel("Narrador", "Você olha para o VOLTA-TEMPO e ele está quebrado, a falta de calibragem explodiu a máquina", true),
            ],
            yearID: 3
        ),
        SequenceModel(
            id: 20,
            modelName: "pc_error.usdz",
            speech: [
                SpeechModel("Narrador", "Ao olhar ao em volta, você percebe que a sala que antes era seu laboratório, agora é um cubículo sem portas ou janelas\nComo se aquele lugar nunca tivesse sido aberto antes"),
                SpeechModel("Narrador", "Antes do desespero de tomar, você pensa em algo:\nBasta arrumar a máquina"),
            ],
            choose: ChooseModel("Arrumar VOLTA-TEMPO?", [
                SingleChoose(0, "Sim", "", "", 21),
                SingleChoose(1, "Não", "", "", 22)
            ]),
            yearID: 3
        ),
        SequenceModel(
            id: 21,
            modelName: "pc_error.usdz",
            speech: [
                SpeechModel("Narrador", "Ao tentar arrumar a máquina, você percebe que há peças faltando."),
                SpeechModel("Narrador", "Talvez a viagem no tempo perdeu a alguns pedaços da sua máquina"),
                SpeechModel("Narrador", "Parece que não haverá mais escapatória para você nesta outra era"),
            ],
            yearID: 3
        ),
        SequenceModel(
            id: 22,
            modelName: "pc_error.usdz",
            speech: [
                SpeechModel("Narrador", "Não tem mais nada ao que ser feito"),
            ],
            choose: ChooseModel("Desistir", [
                SingleChoose(0, "Sim", "", "", 1, true),
                SingleChoose(1, "Sim", "", "", 1, true),
            ]),
            yearID: 3
        ),

        // Final verdadeiro (ciclo)
        SequenceModel(
            id: 23,
            modelName: "lab.usdz",
            speech: [
                SpeechModel("Aviso", "Voltando a 2010"),
                SpeechModel("Narrador", "Ao abrir o olho, você olha em volta:\nTudo parece no lugar, seu laboratório\nSua máquina\nSua cama"),
                SpeechModel("Narrador", "Finalmente você chegou em casa"),
            ],
            yearID: 0
        ),
        SequenceModel(
            id: 24,
            modelName: "logo.usdz",
            speech: [
                SpeechModel("Narrador", "Parabéns por finalizar o jogo"),
                SpeechModel("Narrador", "..."),
                SpeechModel("Narrador", ".."),
                SpeechModel("Narrador", "."),
                SpeechModel("Narrador", "Antes de terminar, existe um problema..."),
            ],
            yearID: 0
        ),
        SequenceModel(
            id: 25,
            modelName: "pc_error.usdz",
            speech: [
                SpeechModel("Aviso", "INCONSISTÊNCIAS NO TEMPO ENCONTRADAS\n ALERTA PARA DESTRUIÇÃO DESTA REALIDADE", true),
                SpeechModel("Você", "Isso poderia estar acontecendo?\nSerá que isso é por conta do que eu mexi para voltar até 2010?"),
                SpeechModel("Você", "O que eu faço?\n"),
                SpeechModel("Narrador", "O seu laboratório começa a ser despedaçado pela tentativa do tempo em destruir a realidade inconsistente"),
            ],
            choose: ChooseModel("Desistir", [
                SingleChoose(0, "Viajar no tempo", "Resolver o que você fez", "clock.fill", 26),
                SingleChoose(1, "Ficar", "Deixar o mundo explodir", "hammer.fill", 2, true),
            ]),
            yearID: 0
        ),

        // Final verdadeiro (arrumando o ciclo)
        SequenceModel(
            id: 26,
            modelName: "journal.usdz",
            speech: [
                SpeechModel("Narrador", "Você decide viajar no tempo, agora com sua máquina original"),
                SpeechModel("Narrador", "Retorna a 1980, ao se preparar para tirar a nota do cartaz e evitar problemas, você visualiza você mesmo de antes atrás de você"),
                SpeechModel("Narrador", "Ao se assustar, você esquece de tirar a nota e acelera para fazer o principal:\nremover a senha colocada e refatorar a máquina, saindo daquele tempo"),
            ],
            yearID: 1
        ),
        SequenceModel(
            id: 27,
            modelName: "pc_robot.usdz",
            speech: [
                SpeechModel("Narrador", "Você retorna a 2080, retira a calibragem enquanto evita você mesmo do passado te ver"),
            ],
            yearID: 2
        ),
        SequenceModel(
            id: 28,
            modelName: "guy.usdz",
            speech: [
                SpeechModel("Narrador", "Retornando por fim a seu tempo original"),
                SpeechModel("Narrador", "Tudo voltou a normal e o aviso de incosistências foram embora"),
                SpeechModel("Narrador", "Então você se toca de um coisa..."),
                SpeechModel("Você", "Parece que eu era a figura que vi mais cedo..."),
                SpeechModel("Você", "Por isso o vTimerOS falou que estava falando comigo Novamente"),
            ],
            yearID: 0
        ),
        SequenceModel(
            id: 29,
            modelName: "clock.usdz",
            speech: [
                SpeechModel("Você", "Mas como eu fui parar lá em 1980?"),
                SpeechModel("Você", "Talvez a solução deste problema seja eu apagar minha memória para evitar qualquer possibilidade no meu futuro voltar para lá"),
                SpeechModel("Narrador", "Assim você fez"),
                SpeechModel("Narrador", "Mas algo você não esperava..."),
                SpeechModel("Narrador", "O seu VOLTA-TEMPO ativou sozinho após você remover suas memórias"),
                SpeechModel("Narrador", "Fazendo você voltar novamente a 1980, onde tudo começou"),
                SpeechModel("Narrador", "Agora, mesmo que você não se lembrasse,\nAgora você decifrou como você apareceu em 1980 sem memórias..."),
            ],
            yearID: 0
        ),
    ]

    static func sequenceLastIndex() -> Int {
        return LevelModel.sequences.count - 1
    }

    static func startSequence() -> SequenceModel {
        return LevelModel.sequences[0]
    }

    static func nextSequence (_ currentSequence: Int) -> SequenceModel {
        guard LevelModel.sequences[currentSequence].nextSequence < LevelModel.sequences.count else {
            print("Tentando acessar sequencia inexistente")
            return LevelModel.sequences[0]
        }

        return LevelModel.sequences[LevelModel.sequences[currentSequence].nextSequence]
    }

    // Apenas retorna a proxima sequencia dentro do mesmo level
    static func chooseSequence (_ currentSequence: SequenceModel, _ choose: Int = 0) -> SequenceModel {
        // Verifica se nao esta em estado de erro
        guard let chooseModel: ChooseModel = currentSequence.choose, !chooseModel.chooses[choose].isNextSequenceEnding else {
            fatalError("Sequencia impossivel de escolha")
        }

        return LevelModel.sequences[chooseModel.chooses[choose].nextSequence]
    }
}
