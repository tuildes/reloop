import SwiftUI

struct EndingView: View {
    @Environment(AppRouter.self) private var router
    let endingID: EndingID

    private var ending: Ending {
        Ending.ending(id: endingID)
    }

    var body: some View {
        ScanLineLayout(imageName: ending.backgroundImage) {
            VStack {
                Text("Final: \(ending.name)")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
                    .padding()

                Spacer()

                HStack(alignment: .center, spacing: 16) {
                    RotationItemView(
                        rotationAngle: 20 * .pi / 180,
                        modelName: ending.modelName
                    )
                    .frame(width: 200, height: 200)
                    .scaleEffect(1.5)

                    Text(ending.description)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal)

                Spacer()

                HStack {
                    Spacer()
                    Button("Sair") {
                        router.popToRoot()
                    }
                    .foregroundStyle(.white)
                }
            }
            .padding(32)
        }
        .navigationBarBackButtonHidden()
    }
}
