# spec/models/order_spec.rb
RSpec.describe Order do
  let(:customer) { Customer.new(true) }  # VIP customer for discount
  let(:item1) { Item.new(100, 10) }      # Item with price 100 and stock 10
  let(:item2) { Item.new(50, 5) }        # Item with price 50 and stock 5
  let(:order) { Order.new([item1, item2], customer) }

  describe '#items' do
    it 'returns the items in the order' do
      expect(order.items).to contain_exactly(item1, item2)
    end
  end

  describe '#customer' do
    it 'returns the customer associated with the order' do
      expect(order.customer).to eq(customer)
    end
  end

  describe '#total_cost' do
    it 'calculates the total cost of the order correctly' do
      expect(order.items.sum { |item| item.price }).to eq(150)
    end
  end
end
