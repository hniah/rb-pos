module RailsAdmin::Admin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :email
      end

      show do
        field :email
        field :updated_at
      end

      edit do
        field :email
        field :password do
          required false
        end
        field :password_confirmation
      end
    end
  end
end
