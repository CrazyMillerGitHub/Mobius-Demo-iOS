import Foundation
import Combine
import Mobius_Common

final class OrdersViewModel: ObservableObject {
    @Published var items: Items = .market([])
    @Published var isLoading: Bool = true

    private var dataService: NetworkService

    init(dataService: NetworkService) {
        self.dataService = dataService
        fetchData()
    }

    func fetchData() {
        isLoading = true
        dataService.fetchMarketItems { [weak self] result in
            if case .success(let items) = result {
                self?.items = .market(items)
            } else {
                self?.items = .market([])
            }
            self?.isLoading = false
        }
    }

    func refresh(by segment: Segment) {
        isLoading = true
        switch segment {
        case .market:
            dataService.fetchMarketItems { [weak self] result in
                if case .success(let items) = result {
                    self?.items = .market(items)
                } else {
                    self?.items = .market([])
                }
                self?.isLoading = false
            }
        case .restaurants:
            dataService.fetchRestaurantsItems { [weak self] result in
                if case .success(let items) = result {
                    self?.items = .restaraunts(items)
                } else {
                    self?.items = .restaraunts([])
                }
                self?.isLoading = false
            }
        }
    }
}
