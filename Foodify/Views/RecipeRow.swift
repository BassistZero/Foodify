import SwiftUI

struct RecipeRow: View {
    let recipe: Recipe

    var body: some View {
        NavigationLink {
            RecipeDetail(recipe: recipe)
        } label: {
            makeRow()
        }

    }
}

// MARK: - Configuration

private extension RecipeRow {

    func makeRow() -> some View {
        HStack(alignment: .top) {
            makeImage()
            makeInfo()
            Spacer()
        }
        .background(backgroundColor)
        .foregroundColor(.primary)
        .cornerRadius(20)
    }

    func makeImage() -> some View {
        Image("\(recipe.name) \(recipe.type.capitalized)")
            .resizable()
            .scaledToFill()
            .frame(width: 170, height: 170)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }

    func makeInfo() -> some View {
        VStack(alignment: .leading) {
            Text(recipe.fullName)
                .font(.title)
                .minimumScaleFactor(0.5)
                .lineLimit(2)
                .multilineTextAlignment(.leading)

            Text(recipe.type.capitalized)
                .font(.headline)

            Text("\(L10n.Recipe.creationDateName):")
                .foregroundColor(.secondary)

            Text(recipe.creationDate, style: .date)
                .multilineTextAlignment(.leading)
                .foregroundColor(.secondary)

        }
        .padding()
    }

}

// MARK: - backgroundColor

private extension RecipeRow {

    var backgroundColor: Color {
        switch recipe.type {
        case .salad:
            return .green
        case .soup:
            return .orange
        }
    }

}

// MARK: - Previews

struct RecipeRow_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRow(recipe: RecipesData().recipes[1])
        RecipeRow(recipe: RecipesData().recipes[0])
    }
}
