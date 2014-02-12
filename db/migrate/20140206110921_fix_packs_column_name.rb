class FixPacksColumnName < ActiveRecord::Migration
  def change
    remove_index :packs, :type
    rename_column :packs, :type, :category_id
    add_index :packs, :category_id, unique: false
  end
end
