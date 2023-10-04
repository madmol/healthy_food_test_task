class CalculateOrdersService < ApplicationService
  def initialize(orders)
    @orders = orders
  end

  def self.call(orders)
    orders
  end

  private
end
