class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.string :dpmainprice
      t.string :pricecurrency

      t.timestamps
    end
  end
end
