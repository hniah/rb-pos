class AddFieldsUsers < ActiveRecord::Migration
  def change
    add_column :users, :country, :string
    add_column :users, :description, :text
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :dob, :date
    add_column :users, :gender, :string
    add_column :users, :area_interests, :text
    add_attachment :users, :avatar
  end
end
