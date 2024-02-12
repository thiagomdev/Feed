import UIKit

final class StoryCardCollectionViewCell: UICollectionViewCell {
    static var identifier: String { String(describing: self) }
    private var viewModel: StoryCardCollectionViewModel?

    private lazy var storyCardView: StoryCardCollectionView = {
        let view = StoryCardCollectionView()
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
    
    func setupCell(from stories: [StoryCardObject]) {
        viewModel = StoryCardCollectionViewModel(stories: stories)
    }
}

extension StoryCardCollectionViewCell: UICollectionViewDelegate {
    
}

extension StoryCardCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.numberOfItems ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel = viewModel else { return UICollectionViewCell() }
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: StoryCollectionCell.identifier,
            for: indexPath
        ) as? StoryCollectionCell else { return UICollectionViewCell() }
        cell.setupCell(from: viewModel.update(story: indexPath), indexPath: indexPath)
        return cell
    }
}

extension StoryCardCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 120)
    }
}

extension StoryCardCollectionViewCell: ViewConfig {
    func buildViews() {
        contentView.addSubview(storyCardView)
    }
    
    func pin() {
        storyCardView.pin(to: contentView)
    }
    
    func extraConfig() {
       
    }
}
