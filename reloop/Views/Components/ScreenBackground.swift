import SwiftUI

/// Full-bleed background that stays within the screen bounds.
/// Unbounded `scaledToFill` images in a ZStack often collapse layout to a black screen.
struct ScreenBackground: View {
    let imageName: String

    var body: some View {
        GeometryReader { geometry in
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.height)
                .clipped()
        }
        .ignoresSafeArea()
    }
}
