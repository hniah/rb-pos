class UserProject < ActiveRecord::Base
  extend Enumerize
  validates_presence_of :user_id, :project_id
  belongs_to :user
  belongs_to :project

  enumerize :status, in: [:unstarted, :started, :completed], default: :unstarted

  def self.existed?(user_id, project_id)
    return UserProject.where(user_id: user_id, project_id: project_id).present?
  end
end
