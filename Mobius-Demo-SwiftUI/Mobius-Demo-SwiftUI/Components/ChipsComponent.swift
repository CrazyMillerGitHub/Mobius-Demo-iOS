import SwiftUI

struct ChipsComponent: View {
    @Binding var selectedSegment: Segment
    let segments: [Segment]

    var body: some View {
        HStack {
            ForEach(segments) { segment in
                Text(segment.title)
                    .padding(.horizontal, Constants.horizontalPadding)
                    .padding(.vertical, Constants.verticalPadding)
                    .background(selectedSegment == segment ? Constants.selectedBackgroundColor : Constants.deselectedBackgroundColor)
                    .foregroundColor(selectedSegment == segment ? Constants.selectedForegroundColor : Constants.deselectedForegroundColor)
                    .cornerRadius(Constants.cornerRadius)
                    .onTapGesture {
                        selectedSegment = segment
                    }
                    .font(Constants.font)
                    .animation(Constants.animation, value: selectedSegment)
            }
            Spacer()
        }
        .padding(.init(top: 5, leading: Constants.horizontalStackPadding, bottom: 5, trailing: Constants.horizontalStackPadding))
        .background(.white)
    }
}

extension ChipsComponent {
    struct Constants {
        static let horizontalPadding: CGFloat = 16
        static let verticalPadding: CGFloat = 8
        static let selectedBackgroundColor: Color = .chipsSelected
        static let deselectedBackgroundColor: Color = .chips
        static let selectedForegroundColor: Color = .white
        static let deselectedForegroundColor: Color = .black
        static let cornerRadius: CGFloat = 20
        static let font: Font = .caption
        static let animation: Animation = .easeInOut(duration: 0.3)
        static let horizontalStackPadding: CGFloat = 16
    }
}
