import SwiftUI

struct StartView: View {
    @Binding var path: NavigationPath

    let version: String = "1.0"

    var body: some View {
        ZStack {
            // Image background
            Rectangle()
                .fill(LinearGradient(colors: [Color.appPrimary, Color.appSecondary], startPoint: .topLeading, endPoint: .bottomTrailing))
                .ignoresSafeArea(.all)

            // Clock pattern
            Image("pattern")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .opacity(0.3)
                .blendMode(.softLight)

            // Content
            HStack {
                Image("dvd")
                    .resizable()
                    .scaledToFit()
                    .shadow(color: .black.opacity(0.5), radius: 6, x: -8, y: 8)

                VStack(alignment: .center, spacing: 16) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .padding(.bottom, 24)

                    NavigationLink {
                        GameView(path: $path)
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Iniciar RELOOP")
                            .font(.system(size: 24))
                            .bold()
                            .foregroundStyle(.appBackground)
                    }

                    Text("Finais")
                        .font(.system(size: 24))
                        .bold()
                        .foregroundStyle(.appBackground)
                        .opacity(0.2)

                    Text("Créditos")
                        .font(.system(size: 24))
                        .bold()
                        .foregroundStyle(.appBackground)
                        .opacity(0.2)

                    Text("Trocar idioma: PT-BR")
                        .font(.system(size: 24))
                        .bold()
                        .foregroundStyle(.appBackground)
                        .opacity(0.2)
                }
            }
            .padding(64)

            // Version information
            VStack(alignment: .leading) {
                Spacer()
                HStack {
                    Text(version)
                        .foregroundStyle(.appBackground)
                    Spacer()
                }
                .padding(.leading, 36)
                .padding(.bottom, 4)
            }

            // Scanline
            ScanLine()
        }
    }
}
