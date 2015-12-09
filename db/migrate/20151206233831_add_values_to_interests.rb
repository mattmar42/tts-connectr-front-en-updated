class AddValuesToInterests < ActiveRecord::Migration
  def change
    add_column :interests, :name, :string
    add_column :interests, :description, :text
  end
end
