# spec/services/discount_calculator_spec.rb
RSpec.describe DiscountCalculator do
  let(:customer_vip) { Customer.new(true) }
  let(:customer_regular) { Customer.new(false) }
  let(:discount_calculator_vip) { DiscountCalculator.new(customer_vip) }
  let(:discount_calculator_regular) { DiscountCalculator.new(customer_regular) }

  describe '#apply_discount' do
    it 'applies 10% discount for VIP customers' do
      expect(discount_calculator_vip.apply_discount(100)).to eq(90)
    end

    it 'does not apply discount for regular customers' do
      expect(discount_calculator_regular.apply_discount(100)).to eq(100)
    end
  end
end
