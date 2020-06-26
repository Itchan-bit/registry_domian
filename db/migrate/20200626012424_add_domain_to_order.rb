class AddDomainToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :domains, :order_id, :int
    add_foreign_key :domains, :orders
    add_column :transactions, :order_id, :int
    add_foreign_key :transactions, :orders
    add_column :transactions, :payment_id, :int
  end
end
