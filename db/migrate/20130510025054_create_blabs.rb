class CreateBlabs < ActiveRecord::Migration
  def change
    create_table :blabs do |t|
      t.string :text
      t.timestamps
    end
  end
end
