import SwiftUI

struct OrdersView: View {

    @State private var selectedSegment: Segment = .market
    private let segments: [Segment] = [.market, .restaurants]
    @StateObject private var viewModel = OrdersViewModel(dataService: DataService())

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
                        ForEach(items, id: \.self) { item in
                            OrderComponent()
                                .cornerRadius(Constants.radius)
                        }
                    case .restaraunts(let items):
                        ForEach(items, id: \.self) { item in
                            OrderComponent()
                                .cornerRadius(Constants.radius)
                        }
                    }
                }
            }.animation(.easeInOut, value: viewModel.isLoading)
        }
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
