import SwiftUI

struct TikTokOverlay: View {
    let username: String
    let viewerCount: Int
    let likes: Int
    let comments: [FakeComment]

    var body: some View {
        VStack {
            HStack {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 40, height: 40)
                VStack(alignment: .leading) {
                    Text(username)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("\(viewerCount.formatted()) espectadores")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.7))
                }
                Spacer()
                Text("❤️ \(likes)")
                    .foregroundColor(.white)
                    .font(.subheadline)
            }
            .padding()
            .background(Color.black.opacity(0.3))

            Spacer()

            VStack(alignment: .leading, spacing: 4) {
                ForEach(comments) { comment in
                    HStack {
                        Text(comment.username)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text(comment.message)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.6), .clear]), startPoint: .bottom, endPoint: .top))
        }
    }
}
