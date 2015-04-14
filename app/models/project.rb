class Project < ActiveRecord::Base
  extend Enumerize
  belongs_to :category
  belongs_to :user
  enumerize :privacy, in: [:private, :public], default: :private
end
