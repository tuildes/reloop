import SwiftUI

struct AppView: View {
    @State private var router = AppRouter()

    var body: some View {
        @Bindable var router = router

        NavigationStack(path: $router.path) {
            router.build(screen: .start)
                .navigationDestination(for: Screen.self) { screen in
                    router.build(screen: screen)
                }
        }
        .environment(router)
    }
}
