# spec/services/calculate_orders_service_spec.rb
require 'rails_helper'

RSpec.describe CalculateOrdersService, type: :model do
    let(:ingredient1) { create(:ingredient) }
    let(:ingredient2) { create(:ingredient) }
    let(:ingredient3) { create(:ingredient) }
    let(:ingredient4) { create(:ingredient) }

    let!(:dish1) { create(:dish, ingredients: [ingredient1]) }
    let!(:dish2) { create(:dish, ingredients: [ingredient1, ingredient2]) }
    let!(:dish3) { create(:dish, ingredients: [ingredient3, ingredient4]) }

    let(:allergen_ingredients1) { [ingredient1, ingredient2] }
    let(:allergen_ingredients2) { [ingredient1] }
    let(:allergen_ingredients) do
      [
        [ingredient1, ingredient2],
        [ingredient2, ingredient3, ingredient4],
        [ingredient1, ingredient2]
      ]
    end

    let(:allergen_ingredients_allergen) do
      [[ingredient1, ingredient2, ingredient3, ingredient4]]
    end

    let(:data) { [allergen_ingredients, Dish] }
    let(:data2) { [allergen_ingredients_allergen, Dish] }

  describe "#call" do
    it "returns a list of dishes and their counts without allergic ingredients" do
      result = CalculateOrdersService.call(data)

      expect(result).to eq([
        { name: dish3.name, count: 2 },
        { name: dish1.name, count: 1 }
      ])
    end

    it "returns empty list of dishes " do
      result = CalculateOrdersService.call(data2)

      expect(result).to eq([])
    end
  end
end
