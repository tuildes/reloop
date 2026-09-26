import SwiftUI

@Observable
final class EndingViewModel {
    let ending: Ending

    private let router: AppRouter

    init(endingID: Int, router: AppRouter) {
        self.ending = Ending.ending(id: endingID)
        self.router = router
    }

    func leave() {
        router.popToRoot()
    }
}
