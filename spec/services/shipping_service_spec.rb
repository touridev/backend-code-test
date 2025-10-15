# spec/services/payment_processor_spec.rb
RSpec.describe PaymentProcessor do
  let(:payment_processor) { PaymentProcessor.new }
  let(:customer) { Customer.new }
  let(:amount) { 100 }

  describe '#process_payment' do
    it 'returns true indicating payment success' do
      expect(payment_processor.process_payment(customer, amount)).to be(true)
    end
  end
end
