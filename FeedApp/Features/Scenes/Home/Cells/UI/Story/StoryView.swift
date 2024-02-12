import UIKit

final class StoryView: UIView {
    fileprivate enum Layout {}
    
    lazy var profileImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = Layout.Padding.profileImageViewRadius
        image.clipsToBounds = true
        return image
    }()
    
    lazy var addImageButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(
            UIImage(
                systemName: "plus.circle.fill"
            )?.withRenderingMode(.alwaysTemplate),
            for: .normal
        )
        button.imageView?.tintColor = .blue
        button.backgroundColor = .white
        button.layer.cornerRadius = Layout.Padding.addImageButtonRadius
        button.addTarget(self, action: #selector(handleAddButton), for: .touchUpInside)
        return button
    }()
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = Layout.Padding.numberOfLines
        label.font = .boldSystemFont(ofSize: Layout.Padding.usernameLabelFontSize)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StoryView {
    @objc
    private func handleAddButton() {
        print(#function)
    }
}

extension StoryView: ViewConfig {
    func buildViews() {
        addSubview(profileImageView)
        addSubview(addImageButton)
        addSubview(usernameLabel)
    }
    
    func pin() {
        NSLayoutConstraint.pin([
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: Layout.Padding.topAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: Layout.Padding.largeSize),
            profileImageView.heightAnchor.constraint(equalToConstant: Layout.Padding.largeSize),
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            addImageButton.widthAnchor.constraint(equalToConstant: Layout.Padding.mediumSize),
            addImageButton.heightAnchor.constraint(equalToConstant: Layout.Padding.mediumSize),
            addImageButton.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            addImageButton.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor),
            
            usernameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: Layout.Padding.constants),
            usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.Padding.constants),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Layout.Padding.constants),
        ])
    }
    
    func extraConfig() {
        
    }
}

private extension StoryView.Layout {
    enum Padding {
        static let topAnchor: CGFloat = 15
        static let largeSize: CGFloat = 70
        static let mediumSize: CGFloat = 25
        static let constants: CGFloat = 10
        static let addImageButtonRadius: CGFloat = 12.5
        static let profileImageViewRadius: CGFloat = 35
        static let numberOfLines: Int = 0
        static let usernameLabelFontSize: CGFloat = 12
    }
}
