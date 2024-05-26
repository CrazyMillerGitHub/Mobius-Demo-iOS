import Foundation

public struct MarketOrder: Decodable {
    public let orderID: String
    public let deliveryDate: String
    public let items: [Item]
    public let totalPrice: Double
    public let currency: String
    public let currentStatus: String

    enum CodingKeys: String, CodingKey {
        case orderID = "order_id"
        case deliveryDate = "delivery_date"
        case items
        case totalPrice = "total_price"
        case currency
        case currentStatus = "current_status"
    }
}
