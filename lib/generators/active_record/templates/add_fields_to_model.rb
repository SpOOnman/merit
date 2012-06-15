class AddFieldsTo<%= table_name.camelize %> < ActiveRecord::Migration
  def self.up
    add_column :<%= table_name %>, :sash_id, :integer
    add_column :<%= table_name %>, :points, :integer, :default => 0
    add_column :<%= table_name %>, :level, :integer, :default => 0
    <%- resource = table_name.singularize -%>
    <%= resource.camelize %>.all.each{|<%= resource %>| <%= resource %>.update_attribute(:points, 0) } # Update existing entries

    add_index <%= table_name %>, :sash_id

    # add_foreign_key <%= table_name %>, :sashes
  end

  def self.down
    # remove_foreign_key <%= table_name %>, :sashes

    remove_column :<%= table_name %>, :sash_id
    remove_column :<%= table_name %>, :points
    remove_column :<%= table_name %>, :level
  end
end