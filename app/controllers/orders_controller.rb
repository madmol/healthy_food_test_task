class OrdersController < ApplicationController
  def new
    @order = Order.new
    @ingredients = Ingredient.all
  end

  def create
    order = Order.new(ingredients: excluded_ingredients)
    if order.save
      redirect_to root_path, notice: 'Заказ успешно создан!'
    else
      redirect_to root_path, alert: 'Не удалось создать заказ.'
    end
  end

  private

  def excluded_ingredients

  end
end
