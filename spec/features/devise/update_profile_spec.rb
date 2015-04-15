require 'rails_helper'

describe 'User updates profile feature' do
  let!(:user) { create(:user) }

  it 'allows user to update his own profile' do
    login_as(user, scope: :user)
    visit root_path

    click_on 'Update Profile'

    fill_in 'First name', with: 'Anthony'
    fill_in 'Last name', with: 'Hoang'
    select 'Male', from: 'Gender'
    fill_in 'Dob', with: '09/08/1918'
    attach_file 'Avatar', Rails.root.join('spec','fixtures','test-small.png')
    fill_in 'Current password', with: '123123123'

    click_on 'Save change'

    expect(page).to_not have_css('#error_explanation')
    expect(page).to have_content 'Your account has been updated successfully.'
  end
end
