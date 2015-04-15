class CreateProjectsTable < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.references :category
      t.text :description
      t.references :user
      t.string :difficult_level
      t.integer :cost
      t.integer :time
      t.string :privacy
      t.text :tags
      t.boolean :cloneable, default: false
      t.attachment :banner
    end
  end
end
