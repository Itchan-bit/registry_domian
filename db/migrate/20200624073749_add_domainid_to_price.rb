class AddDomainidToPrice < ActiveRecord::Migration[5.2]
  def change
    add_column :prices, :domain_id, :int
  end
end
