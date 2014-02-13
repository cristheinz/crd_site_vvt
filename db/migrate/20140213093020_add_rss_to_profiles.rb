class AddRssToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :rss, :string
  end
end
