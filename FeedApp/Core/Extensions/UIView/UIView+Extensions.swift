import UIKit

extension UIView {
    func pin(to superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(
                equalTo: superview.safeAreaLayoutGuide.topAnchor
            ),
            leadingAnchor.constraint(
                equalTo: superview.leadingAnchor
            ),
            trailingAnchor.constraint(
                equalTo: superview.trailingAnchor
            ),
            bottomAnchor.constraint(
                equalTo: superview.bottomAnchor
            )
        ])
    }
    
    var shadow: CGColor {
        var shadowColor = layer.shadowColor
        shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 8
        layer.shouldRasterize = true
        layer.masksToBounds = false
        layer.rasterizationScale = UIScreen.main.scale
        return shadowColor ?? .init(red: 0, green: 0, blue: 0, alpha: 0)
    }
}
