import UIKit
import Mobius_Common

final class ChipView: UIButton {
    var segment: Segment?

    var isSelectedChip: Bool = false {
        didSet {
            configureAppearance()
        }
    }

    init(segment: Segment) {
        self.segment = segment
        super.init(frame: .zero)
        configureAppearance()
        self.setTitle(segment.title, for: .normal)
        self.titleLabel?.font = Constants.font
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureAppearance() {
        backgroundColor = isSelectedChip ? Constants.selectedBackgroundColor : Constants.deselectedBackgroundColor
        setTitleColor(isSelectedChip ? Constants.selectedForegroundColor : Constants.deselectedForegroundColor, for: .normal)
        layer.cornerRadius = Constants.cornerRadius
        layer.masksToBounds = true
    }

    private func configureConstraints() {
        guard let titleLabel else { return }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(
                equalToConstant: Constants.verticalPadding * 2 + titleLabel.intrinsicContentSize.height
            ),
            widthAnchor.constraint(
                equalToConstant: Constants.horizontalPadding * 2 + titleLabel.intrinsicContentSize.width
            )
        ])
    }
}

private extension ChipView {
    private struct Constants {
        static let horizontalPadding: CGFloat = 16
        static let verticalPadding: CGFloat = 12
        static let selectedBackgroundColor: UIColor = .systemBlue
        static let deselectedBackgroundColor: UIColor = .lightGray
        static let selectedForegroundColor: UIColor = .white
        static let deselectedForegroundColor: UIColor = .black
        static let cornerRadius: CGFloat = 20
        static let font: UIFont = .systemFont(ofSize: 14, weight: .medium)
    }
}
