class Project < ActiveRecord::Base
  extend Enumerize
  belongs_to :category
  belongs_to :user
  has_many :project_steps

  validates_presence_of :user_id, :category_id, :title, :cost, :time, :privacy, :difficult_level, :can_clone, :description
  validates_numericality_of :cost, only_integer: true
  validates_numericality_of :difficult_level, greater_than: 0

  enumerize :privacy, in: [:private, :public], default: :private
end
