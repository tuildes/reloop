import SwiftUI

func characterColor(_ character: String) -> Color {
    switch character {
        case "Narrador":
            return Color(.appSecondary)

        case "Você":
            return Color(.appPrimary)

        case "Aviso":
            return Color(.red)

        case "vTimerOS":
            return Color(red: 0.2, green: 0.6, blue: 1.0)

        default:
            return .white
    }
}

extension EnvironmentValues {
    @Entry var highlightColor: Color = .accentColor
}

struct TextContent: View {
    @Environment(\.highlightColor) var HighlightColor: Color // Variavel de estado para as cores
    let character: String // Personagem
    let text: String // Texto a ser formatado

    private var attributedString: AttributedString {
        formatText()
    }

    init(_ character: String, _ text: String) {
        self.text = text
        self.character = character
    }

    private func formatText() -> AttributedString {
        var result: AttributedString = AttributedString()
        let _allText: [String.SubSequence] = text.split(separator: "~", omittingEmptySubsequences: false)

        for (index, _text) in _allText.enumerated() {
            var attributedText: AttributedString = AttributedString(_text)

            // Formatar secoes do separador
            if (index % 2 != 0) {
                attributedText.foregroundColor = HighlightColor
                attributedText.font = .boldSystemFont(ofSize: 16)
            }

            result.append(attributedText)
        }

        return result
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(character)
                    .font(.title3)
                    .bold()
                    .foregroundStyle(characterColor(character))
                Text(attributedString)
            }
            Spacer()
        }
        .padding()
        .foregroundStyle(.white)
        .contentShape(Rectangle()) // Permitir onTapGesture em todo o bloco
        .background {
            Rectangle()
                .foregroundStyle(.thinMaterial)
                .cornerRadius(8)
                .opacity(0.8)
        }
    }
}
