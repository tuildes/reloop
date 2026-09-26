import SwiftUI

func characterColor(_ character: String) -> Color {
    switch character {
    case "Narrador":
        return .highlight
    case "Você":
        return .brand
    case "Aviso":
        return .red
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
    @Environment(\.highlightColor) private var highlightColor
    let character: String
    let text: String

    private var attributedString: AttributedString {
        formatText()
    }

    init(_ character: String, _ text: String) {
        self.character = character
        self.text = text
    }

    private func formatText() -> AttributedString {
        var result = AttributedString()
        let parts = text.split(separator: "~", omittingEmptySubsequences: false)

        for (index, part) in parts.enumerated() {
            var attributedText = AttributedString(part)

            if index % 2 != 0 {
                attributedText.foregroundColor = highlightColor
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
        .contentShape(Rectangle())
        .background {
            Rectangle()
                .foregroundStyle(.thinMaterial)
                .cornerRadius(8)
                .opacity(0.8)
        }
    }
}
