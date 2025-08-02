import SwiftUI

struct StartView: View {
    let motionEnabled: Bool
    let buttons: [(String, () -> Void, Bool)] = [
        ("Iniciar", {
            // Iniciar jogo
        }, false),
        ("Crise existencial", {
            print("...")
        }, true),
    ]

    var body: some View {
        ZStack {
            // Image background

            // Content
            HStack {
                Text("LOGO EM CD")

                VStack(alignment: .leading) {
                    ForEach(buttons, id: \.0) { btn in
                        Button(action: btn.1) {
                            Text(btn.0)
                                .padding(.horizontal, 20)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .disabled(btn.2)
                        }
                        .padding(.bottom, 10)
                    }
                }
            }

            // Version information
            VStack(alignment: .leading) {
                Spacer()
                HStack {
                    Text("Versao 0.1")
                    Spacer()

                    // Motion device nao encontrado
                    if !motionEnabled {
                        Spacer()
                        Text("Dispositivo de movimento não disponível")
                            .foregroundColor(.red)
                            .padding()
                    }
                }
            }
        }
    }
}
