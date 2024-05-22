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
                    Color.lightGray
                }
            ).frame(height: 56)
            Text("Split")
                .opacity(0.5)
        }
    }
}
