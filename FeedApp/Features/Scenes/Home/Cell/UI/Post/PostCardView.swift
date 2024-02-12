import UIKit

final class PostCardView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PostCardView: ViewConfig {
    func buildViews() {
        
    }
    
    func pin() {
        
    }
    
    func extraConfig() {
        
    }
}
