# app/customer.rb
class Customer
  attr_reader :vip

  def initialize(vip = false)
    @vip = vip
  end

  def vip?
    @vip
  end
end
