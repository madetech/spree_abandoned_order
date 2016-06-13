class AbandonedOrderEmailDelivery < Struct.new(:params)
  def perform
    abandoned_orders = AbandonedOrdersQuery.new
    AbandonedOrdersNotNotifiedQuery.new(abandoned_orders).find_each do |order|
      AbandonedOrderNotifier.new(order)
    end
  end
end