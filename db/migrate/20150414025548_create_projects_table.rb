class CreateProjectsTable < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.references :category
      t.text :description
      t.references :user
      t.integer :difficult_level
      t.integer :cost
      t.integer :time
      t.string :privacy
      t.text :tags
      t.integer :can_clone, default: 0
    end
  end
end
