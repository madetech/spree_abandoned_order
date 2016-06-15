describe Spree::AbandonedOrderMailer do
  describe 'notification' do
    let(:order) { create(:order_with_line_items, email: 'test@tester.com') }
    let(:mail) { described_class.notify(order).deliver }

    it 'includes the subject' do
      expect(mail.subject).to eq('Abandoned Order')
    end

    it 'includes the receiver email' do
      expect(mail.to).to eq([order.email])
    end
  end
end
