import Foundation

protocol ViewConfig: AnyObject {
    func buildViews()
    func pin()
    func extraConfig()
    func setup()
}

extension ViewConfig {
    func setup() {
        buildViews()
        pin()
        extraConfig()
    }
}
