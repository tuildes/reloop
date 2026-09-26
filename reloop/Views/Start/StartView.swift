import SwiftUI

struct StartView: View {
    @Environment(AppRouter.self) private var router
    @State private var viewModel: StartViewModel?

    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [.brand, .highlight],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .ignoresSafeArea()

            GeometryReader { geometry in
                Image("pattern")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .blendMode(.softLight)
                    .clipped()
            }
            .ignoresSafeArea()

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

                    Button {
                        viewModel?.startGame()
                    } label: {
                        Text("Iniciar RELOOP")
                            .font(.system(size: 24))
                            .bold()
                            .foregroundStyle(Color.background)
                    }

                    Text("Finais")
                        .font(.system(size: 24))
                        .bold()
                        .foregroundStyle(Color.background)
                        .opacity(0.2)

                    Button {
                        viewModel?.openCredits()
                    } label: {
                        Text("Créditos")
                            .font(.system(size: 24))
                            .bold()
                            .foregroundStyle(Color.background)
                            .opacity(0.2)
                    }

                    Text("Trocar idioma: PT-BR")
                        .font(.system(size: 24))
                        .bold()
                        .foregroundStyle(Color.background)
                        .opacity(0.2)
                }
            }
            .padding(64)

            VStack(alignment: .leading) {
                Spacer()
                HStack {
                    Text(viewModel?.version ?? "")
                        .foregroundStyle(Color.background)
                    Spacer()
                }
                .padding(.leading, 36)
                .padding(.bottom, 4)
            }

            ScanLine()
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            if viewModel == nil {
                viewModel = StartViewModel(router: router)
            }
        }
    }
}
