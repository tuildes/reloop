enum Year1980Scenes {
    static let all: [SceneDefinition] = scenes {
        scene(.arrive1980, era: .y1980, model: .clock, next: .scene(.mysteriousFigure)) {
            You("Não lembro o que exatamente aconteceu\nMas pelo visto, o Volta Tempo me trocou de era")
            You("Esta sala é familiar, está parecendo que é a minha, mas em outro período?")
        }

        scene(.mysteriousFigure, era: .y1980, model: .guy, next: .scene(.posterChoice)) {
            Narrator("Ao olhar para frente, você visualiza uma pessoa no centro da sala")
            Narrator("Ela vira e vê você, se assustando. Ao se virar novamente diz: ~NÃO DIGITE O QUE ESTÁ NO CARTAZ~", .red)
            Narrator("A figura então mexe com algo no centro da sala")
            Narrator("Antes que você percebe ela já desapareceu")
            Narrator("Apesar de toda estranheza, você precisa achar alguma forma de voltar a seu tempo, e talvez esta figura tenha a solução")
        }

        choiceScene(.posterChoice, era: .y1980, model: .journal, prompt: "Olhar o cartaz?") {
            You("Parece que tem um cartaz que a figura tera mencionado")
        } choices: {
            Choice("Não", icon: "x.circle.fill", to: .scene(.voltaTempoFound))
            Choice("Sim", icon: "checkmark", to: .scene(.readPoster))
        }

        scene(.readPoster, era: .y1980, model: .journal, next: .scene(.voltaTempoFound)) {
            Narrator("Ao chegar mais perto do cartaz\nVocê visualiza: ~1984~")
            Narrator("Ao olhar mais abaixo existe uma nota\n~ESQUERDA DIREITA ESQUERDA ESQUERDA~")
            Narrator("Você não entende o que exatamente significa,\nMas para não perder tempo, você para de olhar o cartaz e prossegue sua jornada")
        }

        scene(.voltaTempoFound, era: .y1980, model: .pcRight, next: .scene(.tryPasswordChoice)) {
            Narrator("Ao olhar ao centro da sala, parece que o VOLTA-TEMPO viajou junto com você")
            Narrator("Você se aproxima e visualiza que ele pelo jeito está funcionando como deveria\nMas por algum motivo pede uma série de entradas\nde setas ESQUERDA DIREITA")
            Narrator("Parece que há uma nota no VOLTA-TEMPO\nVeja o cartaz para... [~O restante parece rasgado~]")
        }

        choiceScene(.tryPasswordChoice, era: .y1980, model: .pcRight, prompt: "Você quer tentar uma senha?") {
        } choices: {
            Choice("Não", description: "Olhar o cartaz", icon: "newspaper.fill", to: .scene(.readPoster))
            Choice("Sim", description: "Digitar a senha", icon: "lock.fill", to: .scene(.passwordStep1))
        }

        choiceScene(.passwordStep1, era: .y1980, model: .pcRight, prompt: "Senha: ----") {
        } choices: {
            Choice("Esquerda", icon: "arrowshape.left", to: .scene(.passwordStep2))
            Choice("Direita", icon: "arrowshape.right", to: .scene(.passwordWrong))
        }

        choiceScene(.passwordStep2, era: .y1980, model: .pcRight, prompt: "Senha: <---") {
        } choices: {
            Choice("Esquerda", icon: "arrowshape.left", to: .scene(.passwordWrong))
            Choice("Direita", icon: "arrowshape.right", to: .scene(.passwordStep3))
        }

        choiceScene(.passwordStep3, era: .y1980, model: .pcRight, prompt: "Senha: <>--") {
        } choices: {
            Choice("Esquerda", icon: "arrowshape.left", to: .scene(.passwordStep4))
            Choice("Direita", icon: "arrowshape.right", to: .scene(.passwordWrong))
        }

        choiceScene(.passwordStep4, era: .y1980, model: .pcRight, prompt: "Senha: <><-") {
        } choices: {
            Choice("Esquerda", icon: "arrowshape.left", to: .scene(.arrive2080))
            Choice("Direita", icon: "arrowshape.right", to: .scene(.passwordWrong))
        }

        scene(.passwordWrong, era: .y1980, model: .pcRight, next: .scene(.tryPasswordChoice)) {
            Warning("Senha incorreta\nAbortando viagem no tempo")
        }
    }
}
