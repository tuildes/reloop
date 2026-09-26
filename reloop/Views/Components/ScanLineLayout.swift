import SwiftUI

/// Shared screen chrome: background + content + static CRT scan-line overlay.
struct ScanLineLayout<Background: View, Content: View>: View {
    private let background: Background
    private let content: Content

    init(
        @ViewBuilder background: () -> Background,
        @ViewBuilder content: () -> Content
    ) {
        self.background = background()
        self.content = content()
    }

    var body: some View {
        ZStack {
            Color.black
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            background
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                .opacity(0.75)

            content

            Image("scanline")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                .opacity(0.5)
        }
    }
}

extension ScanLineLayout where Background == ScreenBackground {
    init(
        imageName: String,
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            background: { ScreenBackground(imageName: imageName) },
            content: content
        )
    }
}

extension ScanLineLayout where Background == Color {
    init(
        color: Color,
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            background: { color },
            content: content
        )
    }
}
