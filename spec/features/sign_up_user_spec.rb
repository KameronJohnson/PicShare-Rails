require 'rails_helper'

describe "the sign up a user process" do
  it "signs up a new user" do
    visit '/'
    click_on "Sign Up"
    expect(page).to have_content 'Password confirmation'
  end

  it "submits a new user" do
    visit '/users/new'
    fill_in "Email", :with => "kam@johnson.com"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_on 'Sign Up'
    expect(page).to have_content "Welcome"
  end

end
