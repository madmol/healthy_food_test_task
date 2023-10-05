class Api::OrdersController < Api::BaseController
  def calculate_dishes_to_prepare
    render json: CalculateOrdersService.call(prepare_order_data)
  end

  private

  def prepare_order_data
    [Order.eager_load(:ingredients).map(&:ingredients), Dish]
    #in future will be added ability to pass some kind of Orders array or smth like that
  end
end
