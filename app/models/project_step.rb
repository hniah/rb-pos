class ProjectStep < ActiveRecord::Base
  belongs_to :project
  validates_presence_of :title, :description, :project_id
end
