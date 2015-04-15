class Resource < ActiveRecord::Base
  belongs_to :project, inverse_of: :resources
  validates_presence_of :name, :project
end
