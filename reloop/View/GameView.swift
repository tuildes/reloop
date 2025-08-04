import SwiftUI

func ChooseBox(_ choose: SingleChoose, _ angle: Double) -> some View {
    VStack {
        Image(systemName: choose.icon)
            .font(.system(size: 64))

        Text(choose.title)
            .font(.title2)
            .multilineTextAlignment(.center)
            .bold()

        if (!choose.description.isEmpty) {
            Text(choose.description)
                .font(.caption)
                .multilineTextAlignment(.center)
        }
    }
    .scaleEffect(angle + 0.1)
    .opacity(angle)
    .frame(maxWidth: 250)
}

func opacityValue(_ angle: Double) -> Double {
    let value: Double = (((angle - 5) / 15) + 0.3)
    if (value > 1.2) { return 1.2 }
    if (value < 0.4) { return 0.4 }
    return value
}

struct GameView: View {
    @Binding var path: NavigationPath

    // Todos os levels
    let levels: [LevelModel] = LevelModel.levels

    // Motion Device Manager
    @StateObject private var motionManager: MotionManager = MotionManager()

    // Variaveis de estancias dos levels, falas e escolhas
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
                        rotationAngle: motionManager.getAngle(),
                        modelName: actualSequenceModel.modelName
                    )
                    .offset(y: 10)
                    Spacer()
                }

                // HUD
                VStack {
                    HStack{
                        HStack{
                            Text(levels[actualLevel].name)
                        }
                        .frame(width: 60)

                        if actualSpeech == actualSequenceModel.speech.count {
                            if let choose: ChooseModel = actualSequenceModel.choose {
                                Spacer()
                                Text(choose.chooseTitle)
                                    .bold()
                                    .font(.title3)
                                    .foregroundStyle(.appSecondary)
                            }
                        }
                        Spacer()
                        if (motionManager.motionEnabled) {
                            Button { // Reset de giroscopio
                                motionManager.resetAngle()
                            } label: {
                                Image(systemName: "arrow.circlepath")
                                    .imageScale(.large)
                            }
                            .foregroundStyle(.white)
                            .buttonBorderShape(.circle)
                            .buttonStyle(.bordered)
                            .frame(width: 60)

                        } else { // Caso nao tenha giroscopio cria botoes para interacao
                            HStack {
                                Button {
                                    withAnimation {
                                        motionManager.actualAngle += 10
                                    }
                                } label: {
                                    Image(systemName: "arrow.left")
                                        .imageScale(.large)
                                }
                                .disabled(trunc(motionManager.actualAngle) >= 40)
                                .foregroundStyle(.white)

                                Button {
                                    withAnimation {
                                        motionManager.actualAngle -= 10
                                    }
                                } label: {
                                    Image(systemName: "arrow.right")
                                        .imageScale(.large)
                                }
                                .disabled(trunc(motionManager.actualAngle) <= -40)
                                .foregroundStyle(.white)
                            }
                            .frame(width: 60)
                        }
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
                                Button {
                                    let chooseIndex: Int = trunc(motionManager.actualAngle) > 15 ? 0 : 1

                                    if (choose.chooses[chooseIndex].isNextSequenceEnding) {
                                        path.append(String(choose.chooses[chooseIndex].nextSequence))
                                    } else {
                                        withAnimation {
                                            actualSequenceModel = LevelModel.chooseSequence(actualSequenceModel, choose.chooses[chooseIndex].id)
                                            actualSequence = actualSequenceModel.id
                                            actualLevel = actualSequenceModel.yearID
                                            actualSpeech = 0
                                        }
                                    }
                                } label: {
                                    Text("Escolher \(trunc(motionManager.actualAngle) >= 15 ? "esquerda" : "Direita")")
                                        .bold()
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(.appTertiary.opacity(0.25))
                                        .cornerRadius(10)
                                }
                                .padding(.bottom, 16)
                            }
                        }
                    }

                    // Caixa de texto
                    if (actualSpeech < actualSequenceModel.speech.count) {
                        TextContent(character: actualSequenceModel.speech[actualSpeech].character, text: actualSequenceModel.speech[actualSpeech].text)
                            .onTapGesture {
                                if (actualSpeech == (actualSequenceModel.speech.count - 1)) {
                                    // Se for a ultima fala, puxa o ultimo final
                                    if (actualSequence == LevelModel.sequenceLastIndex()) {
                                        path.append(String(3))
                                    }

                                    // Verifica se vai ter um botao de escolha
                                    if (actualSequenceModel.choose != nil) {
                                        withAnimation {
                                            actualSpeech += 1
                                        }

                                    // Sem botao de escolha (proxima sequencia)
                                    } else {
                                        withAnimation {
                                            actualSequenceModel = LevelModel.nextSequence(actualSequence)
                                            actualLevel = actualSequenceModel.yearID
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
