import UIKit

final class OrderCell: UITableViewCell {

    static let identifier = String(describing: OrderCell.self)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .gray.withAlphaComponent(0.6)
    }

    required init?(coder: NSCoder) {
        preconditionFailure("init(coder:) has not been implemented")
        return nil
    }
}
