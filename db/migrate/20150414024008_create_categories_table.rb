class CreateCategoriesTable < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.text :description
    end
  end
end
