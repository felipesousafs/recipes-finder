class Recipe < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_ingredients,
                  lambda { |ingredient_list|
                    {
                      against: :ingredients,
                      ranked_by: ':tsearch',
                      query: parsed_ingredients_list(ingredient_list),
                      using: {
                        tsearch: {
                          any_word: false,
                          normalization: 4, # divides the rank by the mean harmonic distance between extents
                          highlight: {
                            StartSel: '<b>',
                            StopSel: '</b>',
                            MaxWords: 423,
                            MinWords: 156,
                            ShortWord: 2,
                            HighlightAll: true,
                            MaxFragments: 20,
                            FragmentDelimiter: '&hellip;'
                          }
                        }
                      },
                      order_within_rank: 'recipes.ratings DESC'
                    }
                  }

  def self.search(ingredients_list)
    ingredients_list = [ingredients_list] if ingredients_list.instance_of?(String)

    if ingredients_list&.join.blank?
      # if ingredients param is empty, return all ordered by ratings
      order('ratings DESC')
    else
      search_by_ingredients(ingredients_list).with_pg_search_rank.with_pg_search_highlight
    end
  end

  def self.parsed_ingredients_list(ingredients_list)
    return if ingredients_list.blank?

    ingredients_list.compact_blank!

    # i.e: ['tablespoon fresh', 'rice'] returns 'tablespoon<->fresh rice'
    ingredients_list.map { |ingredient| ingredient.gsub(' ', '<->') }.join(' ')
  end
end
