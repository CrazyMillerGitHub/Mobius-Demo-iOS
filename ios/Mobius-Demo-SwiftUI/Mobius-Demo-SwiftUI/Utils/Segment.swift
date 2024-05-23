import Foundation

enum Segment: Int, CaseIterable, Identifiable {
    var id: Int { rawValue }

    case market
    case restaurants

    var title: String {
        switch self {
        case .market: return "Маркет"
        case .restaurants: return "Магазины и рестораны"
        }
    }
}
