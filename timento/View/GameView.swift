import SwiftUI

struct GameView: View {
    // @State private var currentLevel: Int = 0
    @State private var currentSequence: Int = 0
    @State private var actualSequence: SequenceModel = LevelModel.startSequence()
    @State private var actualSpeech: Int = 0

    var body: some View {

        Text("Sequencia atual: \(currentSequence)")
            .font(.title)

        // Sequencia de textos
        if (actualSpeech < actualSequence.speech.count) {
            Text(actualSequence.speech[actualSpeech].character)
                .font(.title2)
            Text(actualSequence.speech[actualSpeech].text)

            Button("Proxima fala") {
                if (actualSpeech == (actualSequence.speech.count - 1)) {
                    // Verifica se vai ter um botao de escolha
                    if (actualSequence.choose != nil) {
                        actualSpeech += 1

                    // Sem botao de escolha (proxima sequencia)
                    } else {
                        actualSequence = LevelModel.nextSequence(currentSequence)
                        currentSequence = actualSequence.id
                        actualSpeech = 0
                    }
                } else {
                    actualSpeech += 1
                }
            }

        // Escolha do jogador
        } else if (actualSequence.choose != nil) {
            ForEach(actualSequence.choose?.chooses ?? [], id: \.id) { choose in
                Button {
                    actualSequence = LevelModel.chooseSequence(actualSequence, choose.id)
                    currentSequence = actualSequence.id
                    actualSpeech = 0
                } label: {
                    if (choose.isNextSequenceEnding) {
                        Text("Final: \(choose.nextSequence)")
                    } else {
                        Text("Escolha: \(choose.title) (Proximo: \(choose.nextSequence))")
                    }
                }
            }
        }
    }
}
