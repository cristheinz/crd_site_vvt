class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :title
      t.string :about
      t.string :mission
      t.string :pillars
      t.string :addr1
      t.string :addr2
      t.string :email
      t.string :tel1
      t.string :tel2
      t.string :tel3
      t.string :att
      t.string :msg1
      t.string :msg2

      t.timestamps
    end
  end
end
