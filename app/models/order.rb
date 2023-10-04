class Order < ApplicationRecord
  has_many :order_ingredients, dependent: :destroy
  has_many :ingredients, through: :order_ingredients
end
