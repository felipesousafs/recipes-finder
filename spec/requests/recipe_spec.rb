require 'rails_helper'

RSpec.describe 'Recipe' do
  let(:recipes) { create_list(:recipe, 10) }

  let!(:ingredient_to_search) { recipes[rand(9)].ingredients.first }

  describe 'GET /' do
    context 'with ingredient param provided from the list' do
      before { get "/?ingredients[]=#{ingredient_to_search}" }

      it { expect(response).to have_http_status :ok }

      it 'returns recipes' do
        expect(assigns(:recipes).size).not_to be_zero
      end
    end

    context 'without ingredient params' do
      before do
        get '/'
      end

      it { expect(response).to have_http_status :ok }

      it 'returns recipes' do
        expect(assigns(:recipes).size).to eq(recipes.count)
      end
    end
  end

  describe 'GET /recipes/:id' do
    context 'with a valid recipe id' do
      let(:recipe) { recipes.first }

      before { get "/recipes/#{recipe.id}" }

      it { expect(response).to have_http_status :ok }

      it 'returns author from selected recipe' do
        expect(response.body).to include(recipe.author)
      end
    end
  end
end
