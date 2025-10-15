# app/services/discount_calculator.rb
class DiscountCalculator
  def initialize(customer)
    @customer = customer
  end

  def apply_discount(total_cost)
    if @customer.vip?
      total_cost * 0.9
    else
      total_cost
    end
  end
end
