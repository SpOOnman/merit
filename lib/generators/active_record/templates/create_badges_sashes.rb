class CreateBadgesSashes < ActiveRecord::Migration
  def self.up
    create_table :badges_sashes, :id => false do |t|
      t.references :badges
      t.references :sashes
      t.boolean :notified_user, :default => false
      t.timestamps
    end

    add_index :badges_sashes, [:badge_id, :sash_id]
    add_index :badges_sashes, :badge_id
    add_index :badges_sashes, :sash_id

    # add_foreign_key :badges_sashes, :badges
    # add_foreign_key :badges_sashes, :sashes
  end

  def self.down
    # remove_foreign_key :badges_sashes, :badges
    # remove_foreign_key :badges_sashes, :sashes

    drop_table :badges_sashes
  end
end
