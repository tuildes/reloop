import SwiftUI

struct CreditsView: View {
    @Environment(AppRouter.self) private var router

    var body: some View {
        ZStack {
            Color.surface
                .ignoresSafeArea()

            VStack(spacing: 24) {
                Text("Créditos")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)

                Text("RELOOP")
                    .font(.title2)
                    .foregroundStyle(.highlight)

                Text("Em breve")
                    .foregroundStyle(.white.opacity(0.7))

                Button("Voltar") {
                    router.pop()
                }
                .foregroundStyle(.brand)
                .padding(.top, 16)
            }
            .padding()

            ScanLine()
        }
        .navigationBarBackButtonHidden()
    }
}
