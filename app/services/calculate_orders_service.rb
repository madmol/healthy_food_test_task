class CalculateOrdersService < ApplicationService
  def initialize(data)
    @allergen_ingredients_arry, @class = data
  end

  def call
    generate_hash
  end

  private

  def find_dishes
    @allergen_ingredients_arry.map do |allergen_ingredients|
      @class.find_dishes_without_allergic_ingredients(allergen_ingredients.pluck(:id)).first&.name
    end.compact
  end

  def generate_hash
    find_dishes.tally
      .sort_by(&:last)
      .reverse_each
      .map { |k, v| { name: k, count: v } }
  end
end
