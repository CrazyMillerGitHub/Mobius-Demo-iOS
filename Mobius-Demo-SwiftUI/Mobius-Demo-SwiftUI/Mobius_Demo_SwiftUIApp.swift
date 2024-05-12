import SwiftUI

@main
struct Mobius_Demo_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                OrdersView()
                    .navigationTitle("Мои заказы")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
