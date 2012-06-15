class CreateBadges < ActiveRecord::Migration
  def self.up
    create_table :badges do |t|
      t.string :name, :null => false
      t.integer :level, :default => 0
      t.string :image
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :badges
  end
end