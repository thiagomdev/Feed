import UIKit

final class StoryCardCollectionView: UIView {
    private lazy var cardViewBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.layer.shadowColor = view.shadow
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.contentInset = .init(
            top: 5,
            left: 0,
            bottom: 5,
            right: 0
        )
        collection.register(
            StoryCollectionCell.self,
            forCellWithReuseIdentifier: StoryCollectionCell.identifier
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

extension StoryCardCollectionView {
    func set(delegate: UICollectionViewDelegate) {
        collectionView.delegate = delegate
    }
    
    func set(dataSource: UICollectionViewDataSource) {
        collectionView.dataSource = dataSource
    }
}

extension StoryCardCollectionView: ViewConfig {
    func buildViews() {
        addSubview(cardViewBackground)
        cardViewBackground.addSubview(collectionView)
    }
    
    func pin() {
        NSLayoutConstraint.pin([
            cardViewBackground.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: 15
            ),
            cardViewBackground.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 15
            ),
            cardViewBackground.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -10
            ),
            cardViewBackground.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor,
                constant: -15
            )
        ])
        
        collectionView.pin(to: cardViewBackground)
    }
    
    func extraConfig() {
        
    }
}
