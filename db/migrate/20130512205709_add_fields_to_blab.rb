class AddFieldsToBlab < ActiveRecord::Migration
  def change
    add_column :blabs, :tags, :string
  end
end
