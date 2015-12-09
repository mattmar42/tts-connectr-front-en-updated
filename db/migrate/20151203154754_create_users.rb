class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :uid
      t.string :provider
      t.text :bio
      t.string :location
      t.datetime :joined_at

      t.timestamps null: false
    end
  end
end
