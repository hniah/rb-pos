class User < ActiveRecord::Base
  extend Enumerize
  include RailsAdmin::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :username

  enumerize :gender, in: [:male, :female], default: :male

  DEFAULT_URL = '/images/users/avatars/:style/missing.png'
  PATH = ':rails_root/public/:class/:attachment/:id/:style_:basename.:extension'
  VALIDATE_SIZE = { in: 0..1.megabytes, message: 'Photo size too large. Please limit to 1 mb.' }
  has_attached_file :avatar,
                    styles: {small: '60x60#', thumb: '168x168#', large: '400x400#'},
                    default_url: DEFAULT_URL,
                    path: PATH
  validates_attachment :avatar,
                       content_type: {content_type: /\Aimage\/.*\Z/},
                       size: VALIDATE_SIZE

  def country_name
    if ISO3166::Country[self.country].present?
      country = ISO3166::Country[self.country]
      country.translations[I18n.locale.to_s] || country.name
    end
  end
end
