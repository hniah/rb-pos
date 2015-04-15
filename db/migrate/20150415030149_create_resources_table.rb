class CreateResourcesTable < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.references :project
      t.string :name
    end
  end
end
