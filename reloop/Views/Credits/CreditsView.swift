import SwiftUI

struct CreditsView: View {
    @Environment(AppRouter.self) private var router

    var body: some View {
        ScanLineLayout(imageName: "bg_ending") {
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    Button("Voltar") {
                        router.pop()
                    }
                    .font(.headline)
                    .foregroundStyle(.white)
                }
                .padding(.horizontal, 28)
                .padding(.top, 32)

                Spacer(minLength: 8)

                ScrollView {
                    VStack(alignment: .leading, spacing: 22) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Créditos")
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(.white)

                            Text("RELOOP")
                                .font(.title2)
                                .bold()
                                .foregroundStyle(.highlight)
                        }

                        creditBlock(
                            title: "Projeto",
                            body: "Feito em 2025 na Apple Developer Academy."
                        )

                        creditLink(
                            title: "Código aberto",
                            label: "github.com/tuildes/reloop",
                            url: URL(string: "https://github.com/tuildes/reloop")!
                        )

                        creditBlock(
                            title: "Fundos",
                            body: "Criados com IA (Gemini / Banana)."
                        )

                        creditLink(
                            title: "Modelos 3D",
                            label: "poly.pizza",
                            url: URL(string: "https://poly.pizza/")!
                        )
                    }
                    .frame(maxWidth: 520, alignment: .leading)
                    .padding(.horizontal, 36)
                    .padding(.vertical, 8)
                }

                Spacer(minLength: 12)
            }
        }
        .navigationBarBackButtonHidden()
    }

    private func creditBlock(title: String, body: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.brand)

            Text(body)
                .font(.body)
                .foregroundStyle(.white.opacity(0.9))
        }
    }

    private func creditLink(title: String, label: String, url: URL) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.brand)

            Link(destination: url) {
                Text(label)
                    .font(.body)
                    .foregroundStyle(.highlight)
                    .underline()
            }
        }
    }
}
