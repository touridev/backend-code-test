class Checkout
  attr_reader :prices
  private :prices

  def initialize(prices)
    @prices = prices
  end

  def scan(item)
    basket << item.to_sym
  end

  def total
    total = 0

    basket.inject(Hash.new(0)) { |items, item| items[item] += 1; items }.each do |item, count|
      case item
      when :apple, :pear
        # Two for one offer on apples and pears
        total += prices.fetch(item) * (count / 2) + prices.fetch(item) * (count % 2)
      when :banana, :pineapple
        # Half price offer on bananas and pineapples
        if item == :pineapple
          total += (prices.fetch(item) / 2)
          total += prices.fetch(item) * (count - 1)
        else
          total += (prices.fetch(item) / 2) * count
        end
      when :mango
        # Buy 3, get 1 free on mangoes
        free_mangos = count / 4  # for every 4 mangoes, 1 is free
        total += prices.fetch(item) * (count - free_mangos)
      else
        # Regular items, no discount
        total += prices.fetch(item) * count
      end
    end

    total
  end

  private

  def basket
    @basket ||= []
  end
end
