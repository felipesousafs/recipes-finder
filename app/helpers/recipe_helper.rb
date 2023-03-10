module RecipeHelper
  def pretty_print_ingredients(recipe)
    if recipe.respond_to?(:pg_search_highlight)
      recipe.pg_search_highlight.delete('"').gsub(',', ', ').html_safe # rubocop:disable Rails/OutputSafety
    else
      pretty_print_str_array(recipe.ingredients)
    end
  end
end
