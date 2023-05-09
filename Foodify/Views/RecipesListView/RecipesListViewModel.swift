import Foundation

final class RecipesListViewModel: ObservableObject {

    private var recipes = RecipesData().recipes

    var filteredRecipes: [Recipe] {
        switch filterType {
        case .name:
            return recipes.sorted { $0.name < $1.name }
        case .type:
            return recipes.sorted { $0.type.rawValue < $1.type.rawValue }
        case .date:
            return recipes.sorted { $0.creationDate < $1.creationDate }
        }
    }

    @Published var filterType: FilterType = .name

}

// MARK: - Public Methods

extension RecipesListViewModel {

    func delete(at offsets: IndexSet) {
        recipes.remove(atOffsets: offsets)
    }

    func filterByName() {
        filterType = .name
    }

    func filterByType() {
        filterType = .type
    }

    func filterByDate() {
        filterType = .date
    }

}

// MARK: - FilterType

extension RecipesListViewModel {

    enum FilterType: String {

        case name
        case type
        case date

        var capitalized: String {
            self.rawValue.capitalized
        }

    }

}
