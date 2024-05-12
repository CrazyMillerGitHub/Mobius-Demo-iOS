import SwiftUI

struct OrdersView: View {

    private let tabs: [String] = ["Маркет", "Магазины и рестораны"]
    @State private var favoriteColor: String = ""

    var body: some View {
        ScrollView {
            LazyVStack {
                Picker("", selection: $favoriteColor) {
                    ForEach(tabs, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                SplitComponent(data: .init())
                ForEach(1...10, id: \.self) { value in
                    OrderComponent()
                }
            }
        }
    }
}

#Preview {
    OrdersView()
}
