import SwiftUI

struct ContentView: View {
    @State private var useFilter = false
    @State private var viewerCount = Int.random(in: 3000...80000)
    @State private var likes = 0
    @State private var comments: [FakeComment] = []
    @State private var showHiddenMenu = false
    @State private var tapCount = 0

    let timer = Timer.publish(every: 2.0, on: .main, in: .common).autoconnect()
    let likeTimer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            CameraView(applyFilter: useFilter)
                .edgesIgnoringSafeArea(.all)

            TikTokOverlay(username: "@adrianmolx", viewerCount: viewerCount, likes: likes, comments: comments)

            if showHiddenMenu {
                VStack {
                    Toggle("Filtro tipo TikTok", isOn: $useFilter)
                    Stepper("Espectadores: \(viewerCount)", value: $viewerCount, in: 3000...80000, step: 500)
                }
                .padding()
                .background(Color.black.opacity(0.6))
                .cornerRadius(10)
                .padding()
            }
        }
        .onTapGesture {
            tapCount += 1
            if tapCount >= 3 {
                showHiddenMenu.toggle()
                tapCount = 0
            }
        }
        .onReceive(timer) { _ in
            withAnimation {
                viewerCount += Int.random(in: -50...80)
                comments.append(FakeComment.random())
                if comments.count > 10 {
                    comments.removeFirst()
                }
            }
        }
        .onReceive(likeTimer) { _ in
            likes += Int.random(in: 1...3)
        }
    }
}
