class AddRegistrantidToPostalinfo < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :registrant_id, :int
  end
end
