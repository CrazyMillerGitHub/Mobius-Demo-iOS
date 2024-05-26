import UIKit
import Combine
import Mobius_Common

final class OrdersViewController: UITableViewController {

    private let viewModel: OrdersViewModel
    private var cancellables = Set<AnyCancellable>()

    init(viewModel: OrdersViewModel = OrdersViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        preconditionFailure("init(coder:) has not been implemented")
        return nil
    }

    private lazy var chipsComponent: UIView = {
        return ChipsComponentView(
            segments: Segment.allCases,
            initialSelectedSegment: Segment.market
        ) { [weak self] segment in
            guard let segment else { return }
            self?.viewModel.refresh(by: segment)
        }
    }()

    override func loadView() {
        super.loadView()
        registerCells()

        view.backgroundColor = .systemBackground
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Заказы"
        bindViewModel()
        viewModel.fetchData()
    }

    override func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        guard section < 1 else {
            preconditionFailure("Not supported")
        }
        return chipsComponent
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.orders.count
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

extension OrdersViewController {
    private func registerCells() {
        tableView.register(OrderCell.self, forCellReuseIdentifier: OrderCell.identifier)
        tableView.register(SplitCell.self, forCellReuseIdentifier: SplitCell.identifier)
    }

    private func bindViewModel() {
        viewModel.$orders
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
}
