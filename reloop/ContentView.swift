import SwiftUI

struct ContentView: View {
    @State private var path: NavigationPath = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            StartView(path: $path)
                .navigationDestination(for: String.self) { i in
                    EndingView(path: $path, ending: EndingModel.all[Int(i) ?? 0])
                        .navigationBarBackButtonHidden()
                }
        }
    }
}
