class WishList < ActiveRecord::Base
  validates_presence_of :user_id, :project_id
  belongs_to :user
  belongs_to :project

  def self.existed?(user_id, project_id)
    return WishList.where(user_id: user_id, project_id: project_id).present?
  end
end
