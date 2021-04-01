require 'rails_helper'

RSpec.describe 'Link', type: :feature do
  scenario 'User is able to submit new link' do
    visit root_path
    fill_in 'link_url', with: 'https://josias-alvarado.me'
    click_on 'Shorten!'
    sleep(1)
    expect(page).to have_content('gNoSdy') # URL hashid
  end

  scenario 'User is able to access Admin Links panel' do
    visit new_admin_user_session_url
    sleep(1)
    fill_in 'admin_user_email', with: 'admin@example.com'
    fill_in 'admin_user_password', with: 'password'
    click_on 'Login'
    sleep(1)
    visit '/admin/links'
    sleep(1)
    expect(page).not_to have_content('New Link')
  end

  scenario 'User is able to access Admin Requests panel' do
    visit new_admin_user_session_url
    sleep(1)
    fill_in 'admin_user_email', with: 'admin@example.com'
    fill_in 'admin_user_password', with: 'password'
    click_on 'Login'
    sleep(1)
    visit '/admin/requests'
    sleep(1)
    expect(page).not_to have_content('New Request')
  end
end
