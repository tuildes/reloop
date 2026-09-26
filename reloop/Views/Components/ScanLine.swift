import SwiftUI

struct ScanLine: View {
    var body: some View {
        GeometryReader { geometry in
            Image("scanline")
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.height)
                .clipped()
        }
        .ignoresSafeArea()
        .blendMode(.overlay)
        .allowsHitTesting(false)
    }
}
