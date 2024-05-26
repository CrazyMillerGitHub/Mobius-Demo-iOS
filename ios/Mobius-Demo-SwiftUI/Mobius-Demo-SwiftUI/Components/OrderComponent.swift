import SwiftUI
import Mobius_Common

struct MarketOrderComponent: View {

    let item: MarketOrder

    var body: some View {
        ZStack {
            Color.white
                .frame(height: 250)
            Text("Order")
                .opacity(0.5)
        }
    }
}

struct RestaurantOrderComponent: View {

    let item: RestaurantOrder

    var body: some View {
        ZStack {
            Color.white
                .frame(height: 250)
            Text("Order")
                .opacity(0.5)
        }
    }
}
