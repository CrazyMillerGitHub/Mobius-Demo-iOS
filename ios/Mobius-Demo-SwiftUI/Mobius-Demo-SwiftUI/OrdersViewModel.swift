import Foundation
import Combine

final class OrdersViewModel: ObservableObject {
    @Published var items: Items = .market([])
    @Published var isLoading: Bool = true

    private var dataService: DataService

    init(dataService: DataService) {
        self.dataService = dataService
        fetchData()
    }

    func fetchData() {
        isLoading = true
        dataService.fetchMarketItems { [weak self] items in
            self?.items = .market(items)
            self?.isLoading = false
        }
    }

    func refresh(by segment: Segment) {
        isLoading = true
        switch segment {
        case .market:
            dataService.fetchMarketItems { [weak self] items in
                self?.items = .market(items)
                self?.isLoading = false
            }
        case .restaurants:
            dataService.fetchRestaurantsItems { [weak self] items in
                self?.items = .restaraunts(items)
                self?.isLoading = false
            }
        }
    }
}
