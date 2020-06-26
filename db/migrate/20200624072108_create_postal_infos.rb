class CreatePostalInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :postal_infos do |t|
      t.string :name
      t.string :organization

      t.timestamps
    end
  end
end
