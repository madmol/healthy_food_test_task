require 'rails_helper'

RSpec.describe Api::OrdersController, type: :controller do
  describe "GET #calculate_dishes_to_prepare" do
    it "returns a successful response" do
      get :calculate_dishes_to_prepare
      expect(response).to have_http_status(:success)
    end

    it "calls CalculateOrdersService with correct data" do
      ingredient1 = create(:ingredient)
      ingredient2 = create(:ingredient)
      ingredient3 = create(:ingredient)
      dish1 = create(:dish, ingredients: [ingredient1])
      dish2 = create(:dish, ingredients: [ingredient1, ingredient2])
      dish3 = create(:dish, ingredients: [ingredient3])
      order = create(:order, ingredients: [ingredient1, ingredient2])

      expect(CalculateOrdersService).to receive(:call) do |data, model|
        expect(data.map(&:to_a)).to eq([[ingredient1, ingredient2]])
        expect(model).to eq(Dish)
      end

      get :calculate_dishes_to_prepare
    end

    it "returns JSON response with calculated data" do
      calculated_data = [
        { name: "Dish 1", count: 3 },
        { name: "Dish 2", count: 1 },
      ]

      allow(CalculateOrdersService).to receive(:call).and_return(calculated_data)

      get :calculate_dishes_to_prepare

      json_response = JSON.parse(response.body)

      expect(json_response).to be_an(Array)

      calculated_data.each_with_index do |expected_data, index|
        expect(json_response[index]["name"]).to eq(expected_data[:name])
        expect(json_response[index]["count"]).to eq(expected_data[:count])
      end
    end
  end
end
