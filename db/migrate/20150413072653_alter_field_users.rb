class AlterFieldUsers < ActiveRecord::Migration
  def up
    remove_column :users, :country
    add_reference :users, :location, index: true
  end

  def down
    remove_column :users, :location_id
    add_column :users, :country, :string
  end
end
