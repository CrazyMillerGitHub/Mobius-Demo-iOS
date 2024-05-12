import SwiftUI

struct SplitComponentModel {
    let title: String
    let subtitle: String
    let action: () -> Void
}

struct SplitComponent: View {

    var data: Loadable<SplitComponentModel>

    var body: some View {
        ZStack {
            Button(
                action: {
                    data.model?.action()
                }, label: {
                    Color.lightGray
                }
            ).frame(height: 56)
            Text("Split")
                .opacity(0.5)
        }
    }
}

#Preview {
    SplitComponent(data: .init())
}
