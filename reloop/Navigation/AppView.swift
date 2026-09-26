import SwiftUI

struct AppView: View {
    @StateObject private var router: AppRouter = .init()

    var body: some View {
        NavigationStack(path: $router.path) {
            router.build(
                screen: Screen.start,
            )
            .navigationDestination(for: Screen.self) { screen in
                router.build(
                    screen: screen
                )
            }
        }
        .environmentObject(router)
    }
}
