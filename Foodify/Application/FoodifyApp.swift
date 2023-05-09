import SwiftUI

@main
struct FoodifyApp: App {

    var body: some Scene {
        WindowGroup {
            RecipesListView(viewModel: RecipesListViewModel())
        }
    }

}
