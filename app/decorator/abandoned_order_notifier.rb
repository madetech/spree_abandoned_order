class AbandonedOrderNotifier
  def initialize(order)
    @order = order
  end

  def save
    deliver_email && log_delivery
  end

  private

  def deliver_email
    AbandonedOrderMailer.notify(@order).deliver
  end

  def log_delivery
    Spree::AbandonedOrder.create(order: @order, email_sent_at: Time.zone.now)
  end
end