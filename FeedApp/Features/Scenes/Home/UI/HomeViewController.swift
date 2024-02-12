import UIKit

final class HomeViewController: UIViewController {
    private let viewModel: HomeViewModelProtocol
    
    private lazy var homeView: HomeView = {
        let view = HomeView()
        view.set(delegate: self)
        view.set(dataSource: self)
        return view
    }()
    
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = homeView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
}

extension HomeViewController: UICollectionViewDelegate {

}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        viewModel.display(indexPath: indexPath, to: collectionView.frame)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return viewModel.numberOfItems
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: StoryCardCollectionViewCell.identifier,
            for: indexPath
        ) as? StoryCardCollectionViewCell else {
            return UICollectionViewCell() }
        cell.setupCell(from: viewModel.stories)
        return cell
    }
}
