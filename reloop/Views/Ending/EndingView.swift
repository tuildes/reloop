import SwiftUI

struct EndingView: View {
    @Environment(AppRouter.self) private var router
    let endingID: Int

    @State private var viewModel: EndingViewModel?

    var body: some View {
        Group {
            if let viewModel {
                endingContent(viewModel)
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            if viewModel == nil {
                viewModel = EndingViewModel(endingID: endingID, router: router)
            }
        }
    }

    @ViewBuilder
    private func endingContent(_ viewModel: EndingViewModel) -> some View {
        GeometryReader { geometry in
            ZStack {
                Image(viewModel.ending.backgroundImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                    .ignoresSafeArea()

                VStack {
                    Text("Final \(viewModel.ending.id + 1): **\(viewModel.ending.name)**")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .padding()

                    Spacer()

                    HStack {
                        RotationItemView(
                            rotationAngle: 20 * .pi / 180,
                            modelName: viewModel.ending.modelName
                        )
                        .frame(width: 200, height: 200)
                        .padding()
                        .scaleEffect(1.5)

                        Text(viewModel.ending.description)
                            .padding()
                            .foregroundStyle(.white)
                    }

                    Spacer()

                    HStack {
                        Spacer()
                        Button("Sair") {
                            viewModel.leave()
                        }
                        .foregroundStyle(.white)
                    }
                }
                .padding(32)
                .frame(width: geometry.size.width, height: geometry.size.height)

                ScanLine()
            }
        }
    }
}
