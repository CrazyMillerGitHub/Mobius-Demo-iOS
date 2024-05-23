import UIKit

final class OrdersViewController: UITableViewController {

    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .systemBackground

        tableView.register(OrderCell.self, forCellReuseIdentifier: OrderCell.identifier)
        tableView.register(SplitCell.self, forCellReuseIdentifier: SplitCell.identifier)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Заказы"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: OrderCell.identifier, for: indexPath) as? OrderCell
        else {
            return UITableViewCell()
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
}
