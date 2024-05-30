import UIKit
import Combine
import Mobius_Common

final class OrdersViewController: UICollectionViewController {

    private let viewModel: OrdersViewModel
    private var cancellables = Set<AnyCancellable>()

    init(viewModel: OrdersViewModel = OrdersViewModel()) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    required init?(coder: NSCoder) {
        preconditionFailure("init(coder:) has not been implemented")
        return nil
    }

    private lazy var chipsComponent: UIView = {
        let chips = ChipsComponentView(
            segments: Segment.allCases,
            initialSelectedSegment: Segment.market
        ) { [weak self] segment in
            guard let segment else { return }
            self?.viewModel.refresh(by: segment)
        }
        chips.translatesAutoresizingMaskIntoConstraints = false
        return chips
    }()

    override func loadView() {
        super.loadView()
        registerCells()

        view.addSubview(chipsComponent)

        NSLayoutConstraint.activate([
            chipsComponent.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            chipsComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chipsComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])

        collectionView.contentInset = .init(
            top: 30,
            left: 0,
            bottom: 0,
            right: 0
        )
        collectionView.backgroundColor = .secondaryApp
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Заказы"
        bindViewModel()
        viewModel.fetchData()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard section > 0 else { return 1 }
        return viewModel.orders.count
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SplitCell.identifier,
                for: indexPath
            ) as? SplitCell else {
                return UICollectionViewCell()
            }
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: OrderCell.identifier,
                for: indexPath
            ) as? OrderCell else {
                return UICollectionViewCell()
            }
            return cell
        case _:
            return UICollectionViewCell()
        }
    }
}

extension OrdersViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(
            width: view.bounds.width,
            height: indexPath.section == 0 ? 74 : 200
        )
    }
}

extension OrdersViewController {
    private func registerCells() {
        collectionView.register(OrderCell.self, forCellWithReuseIdentifier: OrderCell.identifier)
        collectionView.register(SplitCell.self, forCellWithReuseIdentifier: SplitCell.identifier)
    }

    private func bindViewModel() {
        viewModel.$orders
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.collectionView.reloadData()
            }
            .store(in: &cancellables)
    }
}
