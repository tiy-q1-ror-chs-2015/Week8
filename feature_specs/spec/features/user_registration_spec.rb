require 'rails_helper'

describe 'user registration' do
  it 'should register a user successfully' do
    visit root_path
    # print page.html
    # save_and_open_page
    click_link 'Register'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Logout test@test.com")
    expect(page).not_to have_content("Login")
    expect(page).not_to have_content("Register")
  end

  it 'should register a user unsuccessfully' do
    visit root_path
    click_link 'Register'
    click_button 'Sign up'
    expect(page).not_to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("2 errors prohibited this user from being saved:")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
    # save_and_open_page
  end

  it 'should sign in successfully' do
    FactoryGirl.create(:user)
    visit root_path
    click_link "Login"
    fill_in 'Email', with: "dude@sup.com"
    fill_in 'Password', with: "password"
    click_button "Log in"
    expect(page).to have_content("Signed in successfully.")
    expect(page).not_to have_content("Login")
    expect(page).not_to have_content("Register")
  end
end


