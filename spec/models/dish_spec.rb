# spec/models/dish_spec.rb
require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "scope :find_dishes_without_allergic_ingredients" do
    let(:ingredient1) { create(:ingredient) }
    let(:ingredient2) { create(:ingredient) }
    let(:ingredient3) { create(:ingredient) }
    let(:dish1) { create(:dish, ingredients: [ingredient1, ingredient2]) }
    let(:dish2) { create(:dish, ingredients: [ingredient1, ingredient3]) }
    let(:dish3) { create(:dish, ingredients: [ingredient1]) }
    let(:allergen_ingredient_ids) { [ingredient2.id, ingredient3.id] }

    it "returns dishes without allergic ingredients" do
      dishes = Dish.find_dishes_without_allergic_ingredients(allergen_ingredient_ids)
      expect(dishes).to include(dish3)
      expect(dishes).not_to include(dish1)
      expect(dishes).not_to include(dish2)
    end
  end
end
