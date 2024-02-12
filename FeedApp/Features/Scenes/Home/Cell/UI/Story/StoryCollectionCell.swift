import UIKit

final class StoryCollectionCell: UICollectionViewCell {
    static var identifier: String { String(describing: self) }
    
    private lazy var storyView: StoryView = {
        let view = StoryView()
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

extension StoryCollectionCell {
    func setupCell(from story: StoryCardObject, indexPath: IndexPath) {
        storyView.profileImageView.image = UIImage(named: story.image)
        storyView.usernameLabel.text = story.username
        storyView.addImageButton.isHidden = indexPath.row == 0 ? false : true
    }
}

extension StoryCollectionCell: ViewConfig {
    func buildViews() {
        contentView.addSubview(storyView)
    }
    
    func pin() {
        storyView.pin(to: self)
    }
    
    func extraConfig() {
        
    }
}
