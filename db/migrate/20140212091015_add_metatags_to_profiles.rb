class AddMetatagsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :keywords, :string
    add_column :profiles, :description, :string
  end
end
