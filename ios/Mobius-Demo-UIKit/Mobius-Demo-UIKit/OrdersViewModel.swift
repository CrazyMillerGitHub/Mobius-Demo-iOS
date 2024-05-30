import Foundation
import Mobius_Common
import Combine

final class OrdersViewModel {
    @Published private(set) var orders: Items = .market([])
    private var cancellables = Set<AnyCancellable>()
    private let networkService = NetworkService()

    func fetchData() {
        networkService.fetchMarketItems { [weak self] result in
            switch result {
            case .success(let items):
                self?.orders = .market(items)
            case .failure(_):
                self?.orders = .market([])
            }
        }
    }

    func refresh(by segment: Segment) {
        orders = .market([])
        switch segment {
        case .market:
            networkService.fetchMarketItems { [weak self] result in
                switch result {
                case .success(let items):
                    self?.orders = .market(items)
                case .failure(_):
                    self?.orders = .market([])
                }
            }
        case .restaurants:
            networkService.fetchRestaurantsItems { [weak self] result in
                switch result {
                case .success(let items):
                    self?.orders = .restaraunts(items)
                case .failure(_):
                    self?.orders = .restaraunts([])
                }
            }
        default:
            preconditionFailure("Unknown case")
        }
    }
}
