enum IntroScenes {
    static let all: [SceneDefinition] = scenes {
        scene(.intro, era: .y2010, model: .clock, next: .scene(.arrive1980)) {
            Narrator("Um cientista se tranca por meses em seu laboratório em busca dos segredos da ~viagem do tempo~\nTodos duvidavam de sua área de pesquisa")
            Narrator("Um pequeno computador que permitia a volta no tempo, chamado ~Volta Tempo~")
            Narrator("Mas o que ninguém sabia, que ele (~você~), a poucos minutos tinha finalizado a sua nova invenção")
            Narrator("Você não sabe por que, mas existe um buraco na memória, do momento da criação do Volta-Tempo\nE o agora...")
        }
    }
}
