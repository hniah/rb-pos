class CreateServicesTable < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.references :project
      t.string :name
    end
  end
end
