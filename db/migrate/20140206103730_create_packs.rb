class CreatePacks < ActiveRecord::Migration
  def change
    create_table :packs do |t|
      t.integer :type
      t.boolean :promo
      t.boolean :star
      t.boolean :international

      t.timestamps
    end
  end
end
