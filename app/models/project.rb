class Project < ActiveRecord::Base
  extend Enumerize
  belongs_to :category
  belongs_to :user
  has_many :project_steps, inverse_of: :project
  accepts_nested_attributes_for :project_steps

  validates_presence_of :user_id, :category_id, :title, :cost, :time, :privacy, :difficult_level
  validates_numericality_of :cost, only_integer: true

  enumerize :privacy, in: [:private, :public], default: :private
  enumerize :difficult_level, in: [:easy, :normal, :hard], default: :easy
end
