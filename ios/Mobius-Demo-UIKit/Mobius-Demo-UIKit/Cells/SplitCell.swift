import UIKit

final class SplitCell: UICollectionViewCell {

    static let identifier = String(describing: SplitCell.self)

    private let descr: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Split"
        label.textAlignment = .center
        label.layer.opacity = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        preconditionFailure("init(coder:) has not been implemented")
        return nil
    }
    
    private func setupView() {
        backgroundColor = UIColor(named: "secondaryAppColor")!

        contentView.addSubview(descr)

        NSLayoutConstraint.activate([
            descr.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            descr.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
