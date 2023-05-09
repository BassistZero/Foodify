import Foundation

struct Recipe: Hashable, Identifiable {

    let name: String
    let type: RecipeType
    let creationDate = Date()
    let modificationDate = Date()
    let typeIsNamePart: Bool

    var fullName: String {
        typeIsNamePart ? "\(name) \(type.capitalized)" : name
    }

    var id: Int {
        hashValue
    }

    enum RecipeType: String, Hashable {
        case salad
        case soup

        var rawValue: String {
            switch self {
            case .soup:
                return L10n.Recipe.RecipeType.soup
            case .salad:
                return L10n.Recipe.RecipeType.salad
            }
        }

        var capitalized: String {
            self.rawValue.capitalized
        }
    }

}
