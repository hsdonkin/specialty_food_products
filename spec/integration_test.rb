require 'rails_helper'
# for some reason requiring capybara here causes my reviews to no longer be valid
# require 'capybara'

describe "creating a user", {:type => :feature} do
  it 'creates a user account' do
    puts "creating account"
    visit '/'
    click_link 'Sign Up'
    fill_in 'user[:email]', :with => 'testuser@gmail.com'
    fill_in 'user[:password]', :with => 'testpassword'
    fill_in 'user[:password_confirmation]', :with => 'testpassword'
    click_link 'Sign Up'
    #testuser on page indicates successful sign in
    expect(page).to have_content('testuser@gmail.com')
  end
end
