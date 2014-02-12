class AddIndexToPacksType < ActiveRecord::Migration
  def change
    add_index :packs, :type, unique: false
  end
end
