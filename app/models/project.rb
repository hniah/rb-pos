class Project < ActiveRecord::Base
  extend Enumerize
  belongs_to :category
  belongs_to :user
  has_many :project_steps, inverse_of: :project
  accepts_nested_attributes_for :project_steps
  has_many :resources, inverse_of: :project
  accepts_nested_attributes_for :resources
  has_many :services, inverse_of: :project
  accepts_nested_attributes_for :services

  validates_presence_of :user_id, :category_id, :title, :cost, :time, :privacy, :difficult_level
  validates_numericality_of :cost, only_integer: true

  enumerize :privacy, in: [:private, :public], default: :private
  enumerize :difficult_level, in: [:easy, :normal, :hard], default: :easy

  DEFAULT_URL = '/images/projects/covers/:style/missing.jpg'
  PATH = ':rails_root/public/:class/:attachment/:id/:style_:basename.:extension'
  VALIDATE_SIZE = { in: 0..1.megabytes, message: 'Photo size too large. Please limit to 1 mb.' }
  has_attached_file :picture,
                    styles: {thumb: '400x400#'},
                    default_url: DEFAULT_URL,
                    path: PATH
  validates_attachment :picture,
                       content_type: {content_type: /\Aimage\/.*\Z/},
                       size: VALIDATE_SIZE

end
