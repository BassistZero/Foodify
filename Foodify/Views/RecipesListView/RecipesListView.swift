import SwiftUI

struct RecipesListView: View {
    @StateObject var viewModel: RecipesListViewModel

    var body: some View {
        makeListView()
    }

}

// MARK: - Configuration

private extension RecipesListView {

    func makeListView() -> some View {
        NavigationView {
            ZStack {
                makeList()
                makeAddRecipeButton()
            }
            .toolbar {
                ToolbarItemGroup {
                    makeFilterButton()
                }
            }
        }
        .animation(.default, value: viewModel.filterType)
    }

    func makeList() -> some View {
        ScrollView {
            ForEach(viewModel.filteredRecipes) { recipe in
                HStack(alignment: .center) {
                    Spacer()

                    RecipeRow(recipe: recipe)

                    Spacer()
                }
            }
            .onDelete(perform: viewModel.delete)
            .listRowSeparator(.hidden)
        }
        .padding([.leading, .trailing])
        .listStyle(.inset)
        .navigationTitle(L10n.RecipesList.title)
        .navigationBarTitleDisplayMode(.large)
    }

    func makeFilterButton() -> some View {
        HStack {
            Spacer()

            Menu {
                Button(L10n.RecipesList.Filter.name, action: viewModel.filterByName)
                Button(L10n.RecipesList.Filter.type, action: viewModel.filterByType)
                Button(L10n.RecipesList.Filter.date, action: viewModel.filterByDate)
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
            }
        }
    }

    func makeAddRecipeButton() -> some View {
        VStack(alignment: .trailing) {
            Spacer()

            HStack(alignment: .bottom) {
                Spacer()

                Button {
                    // TODO: Add New Recipe Screen Transition
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                        .padding()
                }
            }
        }
    }

}

// MARK: - Previews

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView(viewModel: RecipesListViewModel())
    }
}
