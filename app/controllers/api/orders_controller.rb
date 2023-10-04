class Api::OrdersController < Api::BaseController
  def calculate_dishes_to_prepare
    render json: CalculateOrdersService.call(orders)
  end

  private

  def orders
    Order.all
    #in future will be added ability to pass some kind of Orders array or smth like that
  end
end
