# app/services/order_processor.rb
class OrderProcessor
  def initialize(discount_calculator, payment_processor, shipping_service)
    @discount_calculator = discount_calculator
    @payment_processor = payment_processor
    @shipping_service = shipping_service
  end

  def process_order(order)
    return "Some items are out of stock" if out_of_stock?(order)

    total_cost = calculate_total_cost(order)
    total_cost = @discount_calculator.apply_discount(total_cost)

    return "Payment failed" unless @payment_processor.process_payment(order.customer, total_cost)

    @shipping_service.ship_items(order.items)
    "Order processed successfully"
  end

  private

  def out_of_stock?(order)
    order.items.any? { |item| item.stock <= 0 }
  end

  def calculate_total_cost(order)
    order.items.sum { |item| item.price }
  end
end
