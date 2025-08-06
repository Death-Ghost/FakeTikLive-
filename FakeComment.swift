import Foundation

struct FakeComment: Identifiable {
    let id = UUID()
    let username: String
    let message: String

    static let sampleUsers = ["@luisito_23", "@mariaxoxo", "@elprofe", "@carla_98", "@ricardo_lol", "@yesi.top"]
    static let sampleMessages = [
        "Qué guapo!", "No puedo creerlo 😂", "Te sigo desde hace tiempo",
        "Saludos desde México!", "Eres famoso?", "Este directo está 🔥", "Jajaja brutal"
    ]

    static func random() -> FakeComment {
        FakeComment(
            username: sampleUsers.randomElement() ?? "@anonimo",
            message: sampleMessages.randomElement() ?? "Wow"
        )
    }
}
