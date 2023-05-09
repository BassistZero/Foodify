import SwiftUI

struct RecipeDetail: View {
    let recipe: Recipe

    var body: some View {
        ScrollView {
            Image("\(recipe.name) \(recipe.type.capitalized)") // Don't change, it's hardcoded
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 20))

            HStack {
                Spacer()
                Text("\(L10n.RecipeDetail.typeName): \(recipe.type.capitalized)")
                    .font(.headline)
            }
            .padding(.all, 5)

            Text(L10n.Mock.RecipeDetail.description)

            Text(L10n.RecipeDetail.recipeName)
                .font(.title)

            HStack {
                Text(L10n.Mock.RecipeDetail.recipe)

                Spacer()
            }

        }
        .navigationTitle(recipe.fullName)
        .navigationBarTitleDisplayMode(.large)
        .padding([.leading, .trailing])
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetail(recipe: RecipesData().recipes[0])
        RecipeDetail(recipe: RecipesData().recipes[1])
    }
}
