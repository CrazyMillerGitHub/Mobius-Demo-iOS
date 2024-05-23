import SwiftUI

struct OrderComponent: View {

    let item: Item

    var body: some View {
        ZStack {
            Color.white
                .frame(height: 250)
            Text("Order")
                .opacity(0.5)
        }
}
}

#Preview {
    OrderComponent(item: .init(title: ""))
}
