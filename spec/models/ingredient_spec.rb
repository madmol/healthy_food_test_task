require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  let(:ingredient_to_delete) { create(:ingredient) }
  let(:ingredients_first_batch) { create_list(:ingredient, 5) }
  let(:ingredients_second_batch) { create_list(:ingredient, 5) }


  it 'deletes associated dishes' do
    dish1 = create(:dish, ingredients: ingredients_first_batch + [ingredient_to_delete])
    dish2 = create(:dish, ingredients: ingredients_second_batch + [ingredient_to_delete])
    dish3 = create(:dish, ingredients: [ingredient_to_delete])
    dish4 = create(:dish, ingredients: ingredients_first_batch)
    dish5 = create(:dish, ingredients: ingredients_second_batch)

    ingredient_to_delete.destroy

    expect(Dish.find_by(id: dish1.id)).to be_nil
    expect(Dish.find_by(id: dish2.id)).to be_nil
    expect(Dish.find_by(id: dish3.id)).to be_nil
    expect(Dish.find_by(id: dish4.id)).not_to be_nil
    expect(Dish.find_by(id: dish5.id)).not_to be_nil
  end
end
