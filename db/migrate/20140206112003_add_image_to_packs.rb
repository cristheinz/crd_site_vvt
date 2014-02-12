class AddImageToPacks < ActiveRecord::Migration
  def change
    add_column :packs, :image, :string
  end
end
