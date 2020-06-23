class CreateRegistrants < ActiveRecord::Migration[5.2]
  def change
    create_table :registrants do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact
      t.string :address

      t.timestamps
    end
  end
end
