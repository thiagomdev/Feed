import Foundation

protocol StoryCardCollectionViewModeling {
    var numberOfItems: Int { get }
    func update(story: IndexPath) -> StoryCardObject
}

final class StoryCardCollectionViewModel {
    private let stories: [StoryCardObject]
    
    init(stories: [StoryCardObject]) {
        self.stories = stories
    }
}

extension StoryCardCollectionViewModel: StoryCardCollectionViewModeling {
    var numberOfItems: Int {
        stories.count
    }
    
    func update(story: IndexPath) -> StoryCardObject {
        stories[story.row]
    }
}
