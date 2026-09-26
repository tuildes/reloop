import SwiftUI

struct ScanLine: View {
    var body: some View {
        Image("scanline")
            .resizable()
            .scaledToFill()
            .frame(
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.height
            )
            .ignoresSafeArea()
            .blendMode(.overlay)
            .allowsHitTesting(false)
    }
}
