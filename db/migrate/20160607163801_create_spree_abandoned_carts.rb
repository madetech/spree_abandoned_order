class CreateSpreeAbandonedOrders < ActiveRecord::Migration
  def up
    create_table :spree_abandoned_orders do |t|
      t.belongs_to :spree_order
      t.datetime   :email_sent_at
    end
  end

  def down
    drop_table :spree_abandoned_orders
  end

end
