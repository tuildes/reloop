import Combine
import SwiftUI

final class AppRouter: Router, ObservableObject {
    @Published var path: NavigationPath = .init()

    func push(_ screen: Screen) {
        path.append(screen)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    func popToRoot() {
        guard !path.isEmpty else { return }
        path.removeLast(path.count)
    }

    @MainActor
    func build(screen _: Screen) -> some View {
        EmptyView()
    }
}
