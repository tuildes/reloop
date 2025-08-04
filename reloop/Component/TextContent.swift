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

struct TextContent: View {
    let character: String
    let text: String

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(character)
                    .font(.title3)
                    .bold()
                    .foregroundStyle(characterColor(character))
                Text(text)
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
