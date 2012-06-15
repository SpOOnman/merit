class CreateMeritActions < ActiveRecord::Migration
  def self.up
    create_table :merit_actions do |t|
      t.references :<%= table_name %>, :null => false
      t.string  :action_method
      t.integer :action_value
      t.boolean :had_errors
      t.string  :target_model
      t.integer :target_id
      t.boolean :processed, :default => false
      t.string  :log, :default => nil
      t.timestamps
    end

    add_index :merit_actions, :<%= table_name %>_id

    # add_foreign_key :merit_actions :<%= table_name.pluralize %>

  end

  def self.down
    # remove_foreign_key :merit_actions :<%= table_name.pluralize %>

    drop_table :merit_actions
  end
end