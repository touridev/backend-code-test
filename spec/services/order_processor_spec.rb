# spec/services/order_processor_spec.rb
RSpec.describe OrderProcessor do
  let(:customer) { Customer.new(true) }
  let(:item) { Item.new(100, 10) }
  let(:order) { Order.new([item], customer) }

  let(:discount_calculator) { DiscountCalculator.new(customer) }
  let(:payment_processor) { PaymentProcessor.new }
  let(:shipping_service) { ShippingService.new }

  let(:processor) { OrderProcessor.new(discount_calculator, payment_processor, shipping_service) }

  describe '#process_order' do
    it 'returns success message when order is processed' do
      allow(payment_processor).to receive(:process_payment).and_return(true)
      allow(shipping_service).to receive(:ship_items)

      result = processor.process_order(order)
      expect(result).to eq("Order processed successfully")
    end

    it 'returns failure when payment fails' do
      allow(payment_processor).to receive(:process_payment).and_return(false)

      result = processor.process_order(order)
      expect(result).to eq("Payment failed")
    end

    it 'returns out of stock message if any item is out of stock' do
      out_of_stock_item = Item.new(100, 0)
      order_with_out_of_stock_item = Order.new([out_of_stock_item], customer)

      result = processor.process_order(order_with_out_of_stock_item)
      expect(result).to eq("Some items are out of stock")
    end
  end
end
