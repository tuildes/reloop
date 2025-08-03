import SwiftUI

struct StartView: View {
    @Binding var path: NavigationPath

    var body: some View {
        ZStack {
            // Image background

            // Content
            HStack {
                Text("LOGO EM CD")
                VStack(alignment: .leading) {
                    NavigationLink("Iniciar TIMENTO") {
                        GameView(path: $path)
                            .navigationBarBackButtonHidden()
                    }
                }
            }

            // Version information
            VStack(alignment: .leading) {
                Spacer()
                HStack {
                    Text("Versao 0.1")
                    Spacer()
                }
            }
        }
    }
}
