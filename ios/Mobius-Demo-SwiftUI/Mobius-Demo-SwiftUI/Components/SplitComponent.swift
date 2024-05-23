import SwiftUI

struct SplitComponentModel {
    let title: String
    let subtitle: String
    let action: () -> Void
}

struct SplitComponent: View {

    var body: some View {
        ZStack {
            Button(
                action: {
                    // TODO: - Add logic
                }, label: {
                    Color.secondaryApp
                }
            ).frame(height: 40)
            Text("Split")
                .opacity(0.5)
        }
    }
}
