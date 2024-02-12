import UIKit

final class HomeView: UIView {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.register(
            StoryCardCollectionViewCell.self,
            forCellWithReuseIdentifier: StoryCardCollectionViewCell.identifier
        )
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView {
    func set(delegate: UICollectionViewDelegate) {
        collectionView.delegate = delegate
    }
    
    func set(dataSource: UICollectionViewDataSource) {
        collectionView.dataSource = dataSource
    }
}

extension HomeView: ViewConfig {
    func buildViews() {
        addSubview(collectionView)
    }
    
    func pin() {
        collectionView.pin(to: self)
    }
    
    func extraConfig() {
        backgroundColor = .backgroundApp
    }
}
