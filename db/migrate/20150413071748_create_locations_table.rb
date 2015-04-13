class CreateLocationsTable < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :iso_code
    end
  end
end
