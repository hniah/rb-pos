require 'rails_helper'

describe 'User change password feature' do
  let!(:user) { create(:user) }

  it 'allows user to change his own password' do
    login_as(user, scope: :user)

    visit root_path

    click_on 'Change Password'

    fill_in 'Password', with: '123123123'
    fill_in 'Password confirmation', with: '123123123'
    ap page
    click_on 'Change'


    expect(page).to_not have_css('#error_explanation')
    expect(page).to have_content 'Your password has been changed successfully.'
  end
end
