import SwiftUI

enum Theme {
    static let accent = Color(red: 0.2431, green: 0.4353, blue: 0.6902)
    static let background = Color(red: 0.0431, green: 0.0667, blue: 0.1020)
    static let card = background.opacity(0.6)
    static let titleFont = Font.system(.largeTitle, design: .rounded).weight(.bold)
    static let headlineFont = Font.system(.headline, design: .rounded)
    static let bodyFont = Font.system(.body, design: .rounded)
    static let cornerRadius: CGFloat = 16
}
