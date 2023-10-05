class Dish < ApplicationRecord
  has_many :dish_ingredients, dependent: :destroy
  has_many :ingredients, through: :dish_ingredients

  validates :name, presence: true, uniqueness: true
  validates :ingredients, presence: true

  scope :find_dishes_without_allergic_ingredients, ->(allergen_ingredient_ids) {
    where.not(
      id: joins(:dish_ingredients)
          .where(dish_ingredients: { ingredient_id: allergen_ingredient_ids })
          .distinct
          .select(:id)
    )
  }
end
