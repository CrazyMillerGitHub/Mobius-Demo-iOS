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
            self?.items = if case .success(let items) = result {
                .market(items)
            } else {
                .market([])
            }
            self?.isLoading = false
        }
    }

    func refresh(by segment: Segment) {
        isLoading = true
        switch segment {
        case .market:
            dataService.fetchMarketItems { [weak self] result in
                self?.items = if case .success(let items) = result {
                    .market(items)
                } else {
                    .market([])
                }
                self?.isLoading = false
            }
        case .restaurants:
            dataService.fetchRestaurantsItems { [weak self] result in
                self?.items = if case .success(let items) = result {
                    .restaraunts(items)
                } else {
                    .restaraunts([])
                }
                self?.isLoading = false
            }
        }
    }
}
