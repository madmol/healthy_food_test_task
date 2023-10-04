class Ingredient < ApplicationRecord
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients
  has_many :order_ingredients, dependent: :destroy
  has_many :orders, through: :order_ingredients

  validates :name, presence: true, uniqueness: true

  before_destroy :delete_dishes_using_ingredient

  private

  def delete_dishes_using_ingredient
    dishes.each { |dish| dish.destroy }
  end
end
