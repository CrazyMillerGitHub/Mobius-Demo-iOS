import UIKit
import Mobius_Common

final class ChipsComponentView: UIView {

    private var selectedSegment: Segment? {
        didSet {
            updateSelection()
            onTapHandler(selectedSegment)
        }
    }

    private let segments: [Segment]
    private let stackView = UIStackView()
    private var onTapHandler: (Segment?) -> Void

    init(
        segments: [Segment],
        initialSelectedSegment: Segment?,
        onTapHandler: @escaping (Segment?) -> Void
    ) {
        self.segments = segments
        self.onTapHandler = onTapHandler
        super.init(frame: .zero)
        self.selectedSegment = initialSelectedSegment
        setupStackView()
        setupChips()
        updateSelection()
        backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }

    private func setupChips() {
        for segment in segments {
            let chip = ChipView(segment: segment)
            chip.addTarget(self, action: #selector(chipTapped(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(chip)
        }
        stackView.addArrangedSubview(UIView())
    }

    @objc private func chipTapped(_ sender: ChipView) {
        selectedSegment = sender.segment
    }

    private func updateSelection() {
        for case let chip as ChipView in stackView.arrangedSubviews {
            UIView.animate(withDuration: 0.3) {
                chip.isSelectedChip = chip.segment == self.selectedSegment
            }
        }
    }
}
