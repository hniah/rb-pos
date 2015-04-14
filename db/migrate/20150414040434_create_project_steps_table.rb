class CreateProjectStepsTable < ActiveRecord::Migration
  def change
    create_table :project_steps do |t|
      t.references :project
      t.string :title
      t.text :description
    end
  end
end
