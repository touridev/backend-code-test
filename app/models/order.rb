# app/models/order.rb
class Order
  attr_reader :items, :customer

  def initialize(items, customer)
    @items = items
    @customer = customer
  end
end
