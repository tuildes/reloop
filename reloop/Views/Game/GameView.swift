import SwiftUI

struct GameView: View {
    @Environment(AppRouter.self) private var router
    @State private var viewModel: GameViewModel?

    var body: some View {
        Group {
            if let viewModel {
                gameContent(viewModel)
            } else {
                ScanLineLayout(color: .surface) {
                    ProgressView()
                        .tint(.white)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .task {
            if viewModel == nil {
                viewModel = GameViewModel(router: router)
            }
        }
    }

    private func gameContent(_ viewModel: GameViewModel) -> some View {
        ScanLineLayout(imageName: viewModel.currentLevel.backgroundImage) {
            ZStack {
                VStack {
                    Spacer()
                    RotationItemView(
                        rotationAngle: viewModel.motionManager.getAngle(),
                        modelName: viewModel.currentScene.modelName
                    )
                    .frame(maxWidth: 420, maxHeight: 320)
                    .offset(y: 10)
                    Spacer()
                }
                .allowsHitTesting(false)

                VStack {
                    hud(viewModel)

                    Spacer()

                    if let choose = viewModel.currentChoose {
                        choiceSection(viewModel, choose: choose)
                    }

                    if viewModel.actualSpeech < viewModel.currentScene.speech.count {
                        let speech = viewModel.currentScene.speech[viewModel.actualSpeech]
                        TextContent(speech.character, speech.text)
                            .environment(\.highlightColor, speech.color)
                            .onTapGesture {
                                viewModel.advanceSpeech()
                            }
                    }
                }
                .padding(.top, 36)
                .padding(.horizontal, 24)
                .padding(.bottom, 4)
            }
        }
    }

    private func hud(_ viewModel: GameViewModel) -> some View {
        HStack {
            Text(viewModel.currentLevel.name)
                .foregroundStyle(.white)
                .frame(width: 60, alignment: .leading)

            if let choose = viewModel.currentChoose {
                Spacer()
                Text(choose.chooseTitle)
                    .bold()
                    .font(.title3)
                    .foregroundStyle(.highlight)
            }

            Spacer()

            if viewModel.motionManager.motionEnabled {
                Button {
                    viewModel.motionManager.resetAngle()
                } label: {
                    Image(systemName: "arrow.circlepath")
                        .imageScale(.large)
                }
                .foregroundStyle(.white)
                .buttonBorderShape(.circle)
                .buttonStyle(.bordered)
                .frame(width: 60)
            } else {
                HStack {
                    Button {
                        viewModel.motionManager.nudge(by: 10)
                    } label: {
                        Image(systemName: "arrow.left")
                            .imageScale(.large)
                    }
                    .disabled(trunc(viewModel.motionManager.actualAngle) >= 40)
                    .foregroundStyle(.white)

                    Button {
                        viewModel.motionManager.nudge(by: -10)
                    } label: {
                        Image(systemName: "arrow.right")
                            .imageScale(.large)
                    }
                    .disabled(trunc(viewModel.motionManager.actualAngle) <= -40)
                    .foregroundStyle(.white)
                }
                .frame(width: 60)
            }
        }
    }

    @ViewBuilder
    private func choiceSection(_ viewModel: GameViewModel, choose: Choose) -> some View {
        if choose.chooses.count >= 2 {
            HStack {
                ChooseBox(
                    choose: choose.chooses[0],
                    angle: opacityValue(viewModel.motionManager.actualAngle)
                )
                Spacer()
                ChooseBox(
                    choose: choose.chooses[1],
                    angle: opacityValue(-viewModel.motionManager.actualAngle)
                )
            }
            .padding(.horizontal, 64)

            Spacer()

            if viewModel.canConfirmChoice {
                Button {
                    viewModel.confirmChoice()
                } label: {
                    Text("Escolher \(viewModel.choiceLabel)")
                        .bold()
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.tint.opacity(0.25))
                        .cornerRadius(10)
                }
                .padding(.bottom, 16)
            }
        }
    }
}
