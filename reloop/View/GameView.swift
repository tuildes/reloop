import SwiftUI

func ChooseBox(_ choose: SingleChoose, _ angle: Double) -> some View {
    VStack {
        Image(systemName: choose.icon)
            .font(.system(size: 64))

        Text(choose.title)
            .font(.title2)
            .bold()

        Text(choose.description)
    }
    .scaleEffect(angle + 0.25)
    .opacity(angle)
}

func opacityValue(_ angle: Double) -> Double {
    let value: Double = (((angle - 5) / 15) + 0.3)
    if (value > 1.2) { return 1.2 }
    if (value < 0.4) { return 0.4 }
    return value
}

struct GameView: View {
    @Binding var path: NavigationPath

    let levels: [LevelModel] = LevelModel.levels

    // Motion Device Manager
    @StateObject private var motionManager: MotionManager = MotionManager()

    @State private var actualSequence: Int = 0
    @State private var actualSequenceModel: SequenceModel = LevelModel.startSequence()
    @State private var actualSpeech: Int = 0
    @State private var actualLevel: Int = 0


    var body: some View {
            ZStack {
                Image(levels[actualLevel].backgroundImage)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                // Modelo 3D na sala
                VStack {
                    Spacer()
                    RotationItemView(
                        rotationAngle: motionManager.getYAngle(),
                        modelName: actualSequenceModel.modelName
                    )
                    Spacer()
                }

                // HUD
                VStack {
                    HStack{
                        Text(levels[actualLevel].name)
                        Spacer()
                        Button { // Reset de giroscopio
                            motionManager.resetAngle()
                        } label: {
                            Image(systemName: "arrow.circlepath")
                                .imageScale(.large)
                        }
                        .foregroundStyle(.white)
                        .buttonBorderShape(.circle)
                        .buttonStyle(.bordered)
                    }

                    Spacer()

                    // Caixas de escolhas
                    if actualSpeech == actualSequenceModel.speech.count {
                        if let choose: ChooseModel = actualSequenceModel.choose {
                            HStack {
                                ChooseBox(choose.chooses[0], opacityValue(motionManager.actualAngle))
                                Spacer()
                                ChooseBox(choose.chooses[1], opacityValue(-motionManager.actualAngle))
                            }
                            .padding(.horizontal, 64)

                            Spacer()

                            if (trunc(fabs(motionManager.actualAngle)) >= 15) {
                                Button("Escolher") {
                                    let chooseIndex: Int = trunc(motionManager.actualAngle) > 15 ? 0 : 1

                                    if (choose.chooses[chooseIndex].isNextSequenceEnding) {
                                        path.append(String(choose.chooses[chooseIndex].nextSequence))
                                    } else {
                                        withAnimation {
                                            actualSequenceModel = LevelModel.chooseSequence(actualSequenceModel, choose.chooses[chooseIndex].id)
                                            actualSequence = actualSequenceModel.id
                                            actualSpeech = 0
                                        }
                                    }
                                }
                                .padding(.bottom, 24)
                            }
                        }
                    }

                    // Caixa de texto
                    if (actualSpeech < actualSequenceModel.speech.count) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(actualSequenceModel.speech[actualSpeech].character)
                                    .font(.title3)
                                    .bold()
                                Text(actualSequenceModel.speech[actualSpeech].text)
                            }
                            Spacer()
                        }
                        .padding()
                        .foregroundStyle(.white)
                        .contentShape(Rectangle()) // Permitir onTapGesture em todo o bloco
                        .onTapGesture {
                            if (actualSpeech == (actualSequenceModel.speech.count - 1)) {
                                // Verifica se vai ter um botao de escolha
                                if (actualSequenceModel.choose != nil) {
                                    withAnimation {
                                        actualSpeech += 1
                                    }

                                // Sem botao de escolha (proxima sequencia)
                                } else {
                                    withAnimation {
                                        actualSequenceModel = LevelModel.nextSequence(actualSequence)
                                        actualSequence = actualSequenceModel.id
                                        actualSpeech = 0
                                    }
                                }
                            } else if (actualSpeech < (actualSequenceModel.speech.count - 1)) {
                                withAnimation {
                                    actualSpeech += 1
                                }
                            }
                        }
                        .background {
                            Rectangle()
                                .foregroundStyle(.thinMaterial)
                                .cornerRadius(8)
                                .opacity(0.8)
                        }
                    }
                }
                .padding(.top, 36)
                .padding(.horizontal, 24)
                .padding(.bottom, 4)

                // Scan Lines (CRT)
                ScanLine()
            }
    }
}
