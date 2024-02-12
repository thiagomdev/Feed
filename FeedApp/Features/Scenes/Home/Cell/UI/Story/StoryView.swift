import UIKit

final class StoryView: UIView {
    
    lazy var profileImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 35
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
        button.layer.cornerRadius = 12.5
        button.addTarget(self, action: #selector(handleAddButton), for: .touchUpInside)
        return button
    }()
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 12)
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
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            profileImageView.widthAnchor.constraint(equalToConstant: 70),
            profileImageView.heightAnchor.constraint(equalToConstant: 70),
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            addImageButton.widthAnchor.constraint(equalToConstant: 25),
            addImageButton.heightAnchor.constraint(equalToConstant: 25),
            addImageButton.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            addImageButton.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor),
            
            usernameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
    
    func extraConfig() {
        
    }
}
