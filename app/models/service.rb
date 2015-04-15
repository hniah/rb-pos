class Service < ActiveRecord::Base
  belongs_to :project, inverse_of: :services
  validates_presence_of :name, :project
end
