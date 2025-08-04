import SwiftUI

struct EndingView: View {
    @Binding var path: NavigationPath
    let ending: EndingModel

    @Environment(\.dismiss) private var dismiss: DismissAction

    var body: some View {
        ZStack {
            // Background image
            Image(ending.backgroundImage)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Final \((ending.id + 1)): **\(ending.name)**")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding()

                Spacer()

                HStack {
                    RotationItemView(rotationAngle: (20 * .pi / 180), modelName: ending.modelName)
                        .frame(width: 200, height: 200)
                        .padding()
                        .scaleEffect(1.5)

                    Text(ending.description)
                        .padding()
                        .foregroundStyle(.white)
                }

                Spacer()

                // Botoes de SAIR e ESCOLHER NOVAMENTE
                HStack {
                    Spacer()
                    Button("Sair") {
                        dismiss()
                    }
                    .foregroundStyle(.white)
                }
            }
            .padding(32)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

            // Scan line effect
            ScanLine()
        }
    }
}
