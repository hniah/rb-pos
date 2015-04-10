module RailsAdmin::User
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :email
        field :username
      end

      show do
        field :email
        field :username
        field :updated_at
      end

      edit do
        field :email
        field :username
        field :password
        field :password_confirmation
      end
    end
  end
end
