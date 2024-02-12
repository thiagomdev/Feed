import Foundation

protocol HomeViewModelProtocol {
    var numberOfItems: Int { get }
    func display(indexPath: IndexPath, to frame: CGRect) -> CGSize
    var stories: [StoryCardObject] { get }
}

final class HomeViewModel {
    private let dataObject = StoryCardObject.dataObject
}

extension HomeViewModel: HomeViewModelProtocol {
    var numberOfItems: Int {
        return 1
    }
    
    var stories: [StoryCardObject] {
        return dataObject
    }
    
    func display(indexPath: IndexPath, to frame: CGRect) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: 120, height: frame.height)
        } else {
            return CGSize(width: frame.width - 120, height: frame.height)
        }
    }
}
