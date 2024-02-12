import UIKit

final class PostCollectionViewCell: UICollectionViewCell {
    private lazy var postCardView: PostCardView = {
        let view = PostCardView()
        view.set(delegate: self)
        view.set(dataSource: self)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PostCollectionViewCell: UICollectionViewDelegate {
    
}

extension PostCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 450)
    }
}

extension PostCollectionViewCell: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 0
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

extension PostCollectionViewCell: ViewConfig {
    func buildViews() {
        
    }
    
    func pin() {
        
    }
    
    func extraConfig() {
        
    }
}
