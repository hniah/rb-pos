require 'rails_helper'

describe 'User can view his own profile feature' do
  let!(:user) { create(:user) }

  it 'allows user view his own password' do
    login_as(user, scope: :user)

    visit root_path

    click_on 'My Profile'

    expect(page).to have_content 'My Profile'
    expect(page).to have_content(user.first_name)
  end
end
