import SwiftUI

struct PlaceholderView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.gray.opacity(0.3))
            .frame(height: 56)
            .padding(.vertical, 4)
    }
}
