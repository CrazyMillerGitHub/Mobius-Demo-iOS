import Foundation

struct Item: Identifiable {
    let id: UUID = UUID()
    let title: String
}

enum Items {
    case market([Item])
    case restaraunts([Item])
}

final class DataService {
    func fetchMarketItems(completion: @escaping ([Item]) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            let items = [
                Item(title: "Item 1"),
                Item(title: "Item 2"),
                Item(title: "Item 3"),
                Item(title: "Item 4")
            ]
            DispatchQueue.main.async {
                completion(items)
            }
        }
    }

    func fetchRestaurantsItems(completion: @escaping ([Item]) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            let items = [
                Item(title: "Item 1"),
                Item(title: "Item 2"),
                Item(title: "Item 3"),
                Item(title: "Item 4")
            ]
            DispatchQueue.main.async {
                completion(items)
            }
        }
    }
}
