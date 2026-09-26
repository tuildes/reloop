import SwiftUI

struct ChooseBox: View {
    let choose: ChoiceOption
    let angle: Double

    var body: some View {
        VStack {
            Image(systemName: choose.icon)
                .font(.system(size: 64))

            Text(choose.title)
                .font(.title2)
                .multilineTextAlignment(.center)
                .bold()

            if !choose.description.isEmpty {
                Text(choose.description)
                    .font(.caption)
                    .multilineTextAlignment(.center)
            }
        }
        .scaleEffect(angle + 0.1)
        .opacity(angle)
        .frame(maxWidth: 250)
    }
}

func opacityValue(_ angle: Double) -> Double {
    let value = ((angle - 5) / 15) + 0.3
    if value > 1.2 { return 1.2 }
    if value < 0.4 { return 0.4 }
    return value
}
