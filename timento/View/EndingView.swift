import SwiftUI

struct EndingView: View {
    let ending: EndingModel

    var body: some View {
        ZStack {
            // Background image
            Image(ending.backgroundImage)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Final \(ending.id): **\(ending.name)**")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding()

                Spacer()

                HStack {
                    RotationItemView(rotationAngle: (20 * .pi / 180), modelName: ending.modelName)
                        .frame(width: 200, height: 200)
                        .padding()

                    Text(ending.description)
                        .padding()
                        .foregroundStyle(.white)
                }

                Spacer()

                // Botoes de SAIR e ESCOLHER NOVAMENTE
                HStack {
                    Button("Sair") {
                        // Ação de sair
                    }
                    .padding()

                    Spacer()

                    Button("Escolher novamente") {
                        // Ação de escolher novamente
                    }
                    .padding()
                }
            }
            .padding(32)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

            // Scan line effect
            ScanLine()
        }
    }
}
