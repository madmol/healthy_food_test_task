class OrdersController < ApplicationController
  def new
    @order = Order.new
    @ingredients = Ingredient.order(name: :asc)
  end

  def create
    order = Order.new(excluded_ingredients)

    flash[:notice] = t('.notice') if order.save
    redirect_to root_path
  end

  private

  def excluded_ingredients
    params.require(:order).permit(ingredient_ids: [])
  end
end
