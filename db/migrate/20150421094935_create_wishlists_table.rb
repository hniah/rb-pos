class CreateWishlistsTable < ActiveRecord::Migration
  def change
    create_table :wish_lists do |t|
      t.references :user
      t.references :project
    end
  end
end
