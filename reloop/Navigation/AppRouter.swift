import SwiftUI

@Observable
final class AppRouter: Router {
    var path: NavigationPath = .init()

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

    @ViewBuilder
    func build(screen: Screen) -> some View {
        switch screen {
        case .start:
            StartView()
        case .game:
            GameView()
        case .ending(let id):
            EndingView(endingID: id)
        case .credits:
            CreditsView()
        }
    }
}
