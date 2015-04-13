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
        field :password do
          required false
        end
        field :password_confirmation
        field :first_name
        field :last_name
        field :gender
        field :dob
        field :location
        field :avatar
        field :description
        field :area_interests
      end
    end
  end
end
