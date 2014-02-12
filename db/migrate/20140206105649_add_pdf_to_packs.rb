class AddPdfToPacks < ActiveRecord::Migration
  def change
    add_column :packs, :pdf, :string
  end
end
