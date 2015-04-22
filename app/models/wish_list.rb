class WishList < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  def self.existed?(user_id, project_id)
    return WishList.where(user_id: user_id, project_id: project_id).present?
  end
end
