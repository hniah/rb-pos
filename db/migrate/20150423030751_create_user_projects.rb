class CreateUserProjects < ActiveRecord::Migration
  def change
    create_table :user_projects do |t|
      t.references :user
      t.references :project
      t.string :status
    end
  end
end
