import Foundation

public struct Item: Decodable {
    let itemID: String
    let name: String
    let quantity: Int
    let pricePerUnit: Double
    let currency: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case itemID = "item_id"
        case name
        case quantity
        case pricePerUnit = "price_per_unit"
        case currency
        case imageURL = "image_url"
    }
}
