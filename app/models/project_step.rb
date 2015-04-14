class ProjectStep < ActiveRecord::Base
  belongs_to :project, inverse_of: :project_steps
  validates_presence_of :title, :description, :project
end
