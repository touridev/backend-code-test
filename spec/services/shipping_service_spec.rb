# spec/services/shipping_service_spec.rb
RSpec.describe ShippingService do
  let(:shipping_service) { ShippingService.new }
  let(:item) { Item.new(100, 10) }

  describe '#ship_items' do
    it 'ships all items' do
      expect { shipping_service.ship_items([item]) }.not_to raise_error
    end
  end
end
