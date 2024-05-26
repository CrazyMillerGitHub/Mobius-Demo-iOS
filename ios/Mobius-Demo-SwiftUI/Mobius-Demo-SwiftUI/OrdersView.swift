import SwiftUI
import Mobius_Common

struct OrdersView: View {

    @State private var selectedSegment: Segment = .market
    private let segments: [Segment] = [.market, .restaurants]
    @StateObject private var viewModel = OrdersViewModel(dataService: NetworkService())

    var body: some View {
        ScrollView {
            VStack {
                ChipsComponent(selectedSegment: $selectedSegment, segments: segments)
                    .onChange(of: selectedSegment) {
                        viewModel.refresh(by: selectedSegment)
                    }
                SplitComponent()
                if viewModel.isLoading {
                    ForEach(0..<5) { _ in
                        PlaceholderView()
                    }
                } else {
                    switch viewModel.items {
                    case .market(let items):
                        ForEach(items, id: \.orderID) { item in
                            MarketOrderComponent(item: item)
                                .cornerRadius(Constants.radius)
                        }
                    case .restaraunts(let items):
                        ForEach(items, id: \.orderID) { item in
                            RestaurantOrderComponent(item: item)
                                .cornerRadius(Constants.radius)
                        }
                    }
                }
            }.animation(.easeInOut, value: viewModel.isLoading)
        }.background(Color.secondaryApp)
    }
}

extension OrdersView {
    private enum Constants {
        static let radius: CGFloat = 15
    }
}

#Preview {
    OrdersView()
}
