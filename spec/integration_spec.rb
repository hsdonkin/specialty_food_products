require 'rails_helper'
# for some reason requiring capybara here causes my reviews to no longer be valid
# require 'capybara'

describe "creating a user", {:type => :feature} do
  it 'creates a user account' do
    visit '/'
    click_link 'Sign Up'
    expect(page).to have_content('Sign Up')
    fill_in 'user_email', :with => 'testuser@gmail.com'
    fill_in 'user_password', :with => 'testpassword'
    fill_in 'user_password_confirmation', :with => 'testpassword'
    click_link 'Sign Up'
    #testuser on page indicates successful sign in
    visit '/'
    click_link 'Sign In'
    fill_in 'user_email', :with => 'testuser@gmail.com'
    fill_in 'user_password', :with => 'testpassword'
    # click_on 'Log In'
    # page.execute_script("document.getElementsByName('commit').submit()")
    visit '/'
    # can't convince capybara to log in for some reason
    # any leads?
    expect(page).to have_content('Sign Out')
  end
end
