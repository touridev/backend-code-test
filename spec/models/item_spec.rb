# spec/models/item_spec.rb
RSpec.describe Item do
  let(:item) { Item.new(100, 10) }

  describe '#price' do
    it 'returns the price of the item' do
      expect(item.price).to eq(100)
    end
  end

  describe '#stock' do
    it 'returns the stock of the item' do
      expect(item.stock).to eq(10)
    end
  end
end
