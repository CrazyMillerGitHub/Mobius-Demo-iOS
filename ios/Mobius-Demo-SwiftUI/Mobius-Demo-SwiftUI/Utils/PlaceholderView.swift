import SwiftUI

struct PlaceholderView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.gray.opacity(0.2))
            .frame(height: 56)
            .padding(.vertical, 4)
    }
}
