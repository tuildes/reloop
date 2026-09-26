import SwiftUI

@Observable
final class StartViewModel {
    let version = "Versão 1.3"

    private let router: AppRouter

    init(router: AppRouter) {
        self.router = router
    }

    func startGame() {
        router.push(.game)
    }

    func openCredits() {
        router.push(.credits)
    }
}
