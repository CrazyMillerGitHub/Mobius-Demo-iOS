public enum Segment: Int, CaseIterable, Identifiable {
    public var id: Int { rawValue }

    case market
    case restaurants

    public var title: String {
        switch self {
        case .market: 
            return "Маркет"
        case .restaurants: 
            return "Магазины и рестораны"
        }
    }
}
