class RecipesController < ApplicationController
  def index
    @recipes = Recipe.search(params[:ingredients]).page(params[:page])
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
