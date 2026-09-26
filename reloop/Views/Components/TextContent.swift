import SwiftUI

extension EnvironmentValues {
    @Entry var highlightColor: Color = .accentColor
}

struct TextContent: View {
    @Environment(\.highlightColor) private var highlightColor
    let character: String
    let text: String

    init(_ character: String, _ text: String) {
        self.character = character
        self.text = text
    }

    private var lines: [[TextSegment]] {
        text.components(separatedBy: "\n").map(Self.parseSegments)
    }

    private static func parseSegments(_ line: String) -> [TextSegment] {
        let parts = line.split(separator: "~", omittingEmptySubsequences: false)
        return parts.enumerated().compactMap { index, part in
            let value = String(part)
            guard !value.isEmpty else { return nil }
            return TextSegment(text: value, isBold: index % 2 != 0)
        }
    }

    private func characterColor(_ character: String) -> Color {
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

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(character)
                    .font(.title3)
                    .bold()
                    .foregroundStyle(characterColor(character))

                VStack(alignment: .leading, spacing: 4) {
                    ForEach(Array(lines.enumerated()), id: \.offset) { _, segments in
                        lineView(segments)
                    }
                }
            }
            Spacer(minLength: 0)
        }
        .padding()
        .contentShape(Rectangle())
        .background {
            Rectangle()
                .foregroundStyle(.thinMaterial)
                .cornerRadius(8)
                .opacity(0.8)
        }
    }

    @ViewBuilder
    private func lineView(_ segments: [TextSegment]) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 0) {
            ForEach(Array(segments.enumerated()), id: \.offset) { _, segment in
                if segment.isBold {
                    CelestWavyText(
                        text: segment.text,
                        color: highlightColor
                    )
                } else {
                    Text(segment.text)
                        .font(.body)
                        .foregroundStyle(.white)
                }
            }
        }
    }
}

private struct TextSegment {
    let text: String
    let isBold: Bool
}

/// Celeste-style wavy bold text: each glyph rides a soft sine wave.
private struct CelestWavyText: View {
    let text: String
    let color: Color

    private let amplitude: CGFloat = 2.4
    private let speed: Double = 3.2
    private let phaseStep: Double = 0.42

    var body: some View {
        TimelineView(.animation(minimumInterval: 1.0 / 30.0, paused: false)) { timeline in
            let time = timeline.date.timeIntervalSinceReferenceDate

            HStack(spacing: 0) {
                ForEach(Array(text.enumerated()), id: \.offset) { index, character in
                    Text(String(character))
                        .font(.body.bold())
                        .foregroundStyle(color)
                        .shadow(color: color.opacity(0.45), radius: 4, y: 0)
                        .offset(
                            y: sin(time * speed + Double(index) * phaseStep) * amplitude
                        )
                        .opacity(
                            0.82 + 0.18 * (0.5 + 0.5 * sin(time * speed + Double(index) * phaseStep))
                        )
                }
            }
        }
    }
}
