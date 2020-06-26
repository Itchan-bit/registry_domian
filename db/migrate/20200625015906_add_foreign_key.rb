class AddForeignKey < ActiveRecord::Migration[5.2]
  def change

    add_reference :addresses, :registrant, index: true
    add_foreign_key :addresses, :registrants

    add_reference :postal_infos, :registrant, index: true
    add_foreign_key :postal_infos, :registrants

  end
end


