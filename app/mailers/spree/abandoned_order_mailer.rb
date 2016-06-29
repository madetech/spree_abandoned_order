module Spree
  class AbandonedOrderMailer < ActionMailer::Base
    def notify(order)
      @order = order
      mail to: @order.email, subject: Spree.t('abandoned_order.email.subject')
    end
  end
end
