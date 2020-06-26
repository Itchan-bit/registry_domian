class AddForiegnKeyToDomain < ActiveRecord::Migration[5.2]
  def change

    # add_reference :prices, :domain, index: true
    add_foreign_key :prices, :domains

  end
end
